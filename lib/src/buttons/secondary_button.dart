import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _buttonBorderRadius = 25.0;
const double _buttonLargeHorizontalPadding = 24.0;
const double _buttonLargeVerticalPadding = 16.0;
const double _buttonSmallVerticalPadding = 8.0;
const double _buttonSmallHorizontalPadding = 16.0;
const double _buttonBorderWidth = 1.0;
const int _colorAnimationDuration = 100;
final Color _buttonColor = Colors.white;
final Color _buttonBorderColor = EufemiaColors.seaGreenAlt;
final Color _buttonTappedColor = EufemiaColors.softGray;
final Color _buttonTextColor = EufemiaColors.seaGreenAlt;
final Color _buttonTappedTextColor = EufemiaColors.seaGreenAlt.withOpacity(0.8);
final Color _buttonDisabledColor = Colors.transparent;
final Color _buttonDisabledTextColor = EufemiaColors.seaGreenAltLight;
final Color _buttonDisabledBorderColor = EufemiaColors.seaGreenAlt.withOpacity(0.5);

/// A Secondary button from the Eufemia Design System
class SecondaryButton extends StatefulWidget {
  final String label;
  final ButtonSize size;
  final VoidCallback onPressed;
  final bool enabled;

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
  }) : super(key: key);

  @override
  _SecondaryButtonState createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> with TickerProviderStateMixin {
  Animation<Color> buttonColorAnimation;
  Animation<Color> textColorAnimation;
  AnimationController colorAnimationController;

  @override
  void initState() {
    super.initState();
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
    colorAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _colorAnimationDuration),
    );

    buttonColorAnimation = ColorTween(
      begin: enabled ? _buttonColor : _buttonDisabledColor,
      end: enabled ? _buttonTappedColor : _buttonDisabledColor,
    ).animate(colorAnimationController);

    textColorAnimation = ColorTween(
      begin: enabled ? _buttonTextColor : _buttonDisabledTextColor,
      end: enabled ? _buttonTappedTextColor : _buttonDisabledTextColor,
    ).animate(colorAnimationController);
  }

  @override
  Widget build(BuildContext context) {
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
                    color: buttonColorAnimation.value,
                    borderRadius: BorderRadius.circular(_buttonBorderRadius),
                    border: Border.all(
                      color: enabled ? _buttonBorderColor : _buttonDisabledBorderColor,
                      width: _buttonBorderWidth,
                    ),
                  ),
                  child: Padding(
                    padding: _getContentPadding(),
                    child: Text(
                      widget.label,
                      style: TextStyle(
                        color: enabled ? textColorAnimation.value : _buttonDisabledTextColor,
                        fontSize: _getFontSize(),
                        height: 1.2,
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
