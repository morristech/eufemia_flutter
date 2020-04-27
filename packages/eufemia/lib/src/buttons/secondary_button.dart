import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _buttonBorderRadius = 25.0;
const double _buttonLargeHorizontalPadding = 24.0;
const double _buttonLargeVerticalPadding = 16.0;
const double _buttonSmallVerticalPadding = 8.0;
const double _buttonSmallHorizontalPadding = 16.0;
const double _buttonBorderWidth = 1.0;
const int _colorAnimationDuration = 100;
final Color _buttonBackgroundColor = Colors.white;
final Color _buttonColor = EufemiaColors.seaGreenAlt;
final Color _buttonTappedColor = EufemiaColors.seaGreenAlt.withOpacity(0.5);
final Color _buttonDisabledBackgroundColor = Colors.transparent;
final Color _buttonDisabledColor = EufemiaColors.seaGreenAlt.withOpacity(0.5);

// Dark mode
final Color _buttonDarkBackgroundColor = Colors.transparent;
final Color _buttonDarkColor = EufemiaColors.mintGreen;
final Color _buttonDarkTappedColor = EufemiaColors.mintGreen.withOpacity(0.5);
final Color _buttonDarkDisabledBackgroundColor = Colors.transparent;
final Color _buttonDarkDisabledColor = EufemiaColors.mintGreen.withOpacity(0.5);

/// A Secondary button from the Eufemia Design System
class SecondaryButton extends StatefulWidget {
  final String label;
  final ButtonSize size;
  final VoidCallback onPressed;
  final bool enabled;

  final Color color;
  final Color disabledColor;
  final Color tappedColor;
  final Color backgroundColor;
  final Color backgroundTappedColor;

  /// A Secondary button from the Eufemia Design System
  ///
  /// * [label]: The label of the button
  /// * [size]: The size of the button, given as a [ButtonSize] enum
  /// * [onPressed]: The onPressed callback for button presses
  /// * [enabled]: Whether the button is enabled or not

  const SecondaryButton({
    Key key,
    @required this.label,
    @required this.onPressed,
    this.size = ButtonSize.large,
    this.enabled = true,
    this.color,
    this.disabledColor,
    this.tappedColor,
    this.backgroundColor,
    this.backgroundTappedColor,
  }) : super(key: key);

  @override
  _SecondaryButtonState createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton>
    with TickerProviderStateMixin {
  Animation<Color> backgroundColorAnimation;
  Animation<Color> colorAnimation;
  AnimationController colorAnimationController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initAnimations();
  }

  @override
  void dispose() {
    colorAnimationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(SecondaryButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    initAnimations();
  }

  void initAnimations() {
    var color =
        widget.color ?? (context.bright ? _buttonColor : _buttonDarkColor);

    var tappedColor = widget.tappedColor ??
        (context.bright ? _buttonTappedColor : _buttonDarkTappedColor);

    var disabledColor = widget.disabledColor ??
        (context.bright ? _buttonDisabledColor : _buttonDarkDisabledColor);

    var backgroundColor = widget.backgroundColor ??
        (context.bright ? _buttonBackgroundColor : _buttonDarkBackgroundColor);

    var disabledBackgroundColor = widget.backgroundColor?.withOpacity(0.8) ??
        (context.bright
            ? _buttonDisabledBackgroundColor
            : _buttonDarkDisabledBackgroundColor);

    setState(() {
      colorAnimationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: _colorAnimationDuration),
      );

      backgroundColorAnimation = ColorTween(
        begin: enabled ? backgroundColor : disabledBackgroundColor,
        end: disabledBackgroundColor,
      ).animate(colorAnimationController);

      colorAnimation = ColorTween(
        begin: enabled ? color : disabledColor,
        end: enabled ? tappedColor : disabledColor,
      ).animate(colorAnimationController);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (colorAnimation != null) {
      return Wrap(
        children: <Widget>[
          Semantics(
            label: widget.label,
            enabled: enabled,
            button: true,
            value: widget.label,
            child: GestureDetector(
              onTapDown: enabled ? _handleTapDown : null,
              onTapUp: enabled ? _handleTapUp : null,
              onTapCancel: enabled ? _handleTapCancel : null,
              child: AnimatedBuilder(
                animation: colorAnimationController,
                builder: (context, _) {
                  return Container(
                    decoration: BoxDecoration(
                      color: backgroundColorAnimation.value,
                      borderRadius: BorderRadius.circular(_buttonBorderRadius),
                      border: Border.all(
                        color: colorAnimation.value,
                        width: _buttonBorderWidth,
                      ),
                    ),
                    child: Padding(
                      padding: _getContentPadding(),
                      child: Text(
                        widget.label,
                        style: TextStyle(
                          color: colorAnimation.value,
                          fontSize: _getFontSize(),
                          height: 1.2,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  bool get enabled => widget.onPressed != null && widget.enabled;

  void _handleTapDown(TapDownDetails details) {
    colorAnimationController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    colorAnimationController.reverse(from: 1.0);
    widget.onPressed();
  }

  void _handleTapCancel() {
    colorAnimationController.reset();
  }

  double _getFontSize() {
    switch (widget.size) {
      case ButtonSize.small:
        return 14.0;
      case ButtonSize.large:
        return 16.0;
      default:
        return 0.0;
    }
  }

  EdgeInsets _getContentPadding() {
    switch (widget.size) {
      case ButtonSize.small:
        return const EdgeInsets.symmetric(
          horizontal: _buttonSmallHorizontalPadding,
          vertical: _buttonSmallVerticalPadding,
        );
      case ButtonSize.large:
        return const EdgeInsets.symmetric(
          horizontal: _buttonLargeHorizontalPadding,
          vertical: _buttonLargeVerticalPadding,
        );
      default:
        return EdgeInsets.zero;
    }
  }
}
