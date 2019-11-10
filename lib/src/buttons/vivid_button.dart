import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _buttonBorderRadius = 25.0;
const double _buttonLargeHorizontalPadding = 24.0;
const double _buttonLargeVerticalPadding = 16.0;
const double _buttonSmallVerticalPadding = 8.0;
const double _buttonSmallHorizontalPadding = 16.0;
const int _colorAnimationDuration = 100;
final Color _buttonColor = EufemiaColors.signalYellow;
final Color _buttonTappedColor = EufemiaColors.signalYellowDark;
final Color _buttonTextColor = EufemiaColors.oceanGreen;
final Color _buttonTappedTextColor = EufemiaColors.oceanGreen.withOpacity(0.8);
final Color _buttonDisabledColor = EufemiaColors.signalYellow.withOpacity(0.5);
final Color _buttonDisabledTextColor = EufemiaColors.oceanGreen.withOpacity(0.5);

/// A vivid button from the Eufemia Design System
class VividButton extends StatefulWidget {
  final String label;
  final ButtonSize size;
  final VoidCallback onPressed;
  final bool enabled;

  /// A vivid button from the Eufemia Design System
  /// * [label]: The label of this button
  /// * [size]: The size of this button, given as a [ButtonSize] enum
  /// * [onPressed]: The onPressed callback for button presses
  /// * [enabled]: Whether the button is enabled or not

  const VividButton({
    Key key,
    @required this.label,
    @required this.onPressed,
    this.size = ButtonSize.large,
    this.enabled = true,
  }) : super(key: key);

  @override
  _VividButtonState createState() => _VividButtonState();
}

class _VividButtonState extends State<VividButton> with TickerProviderStateMixin {
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
  void didUpdateWidget(VividButton oldWidget) {
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
                return Material(
                  color: buttonColorAnimation.value,
                  borderRadius: BorderRadius.circular(_buttonBorderRadius),
                  child: Padding(
                    padding: _getContentPadding(),
                    child: Text(
                      widget.label,
                      style: TextStyle(
                        color: textColorAnimation.value,
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
