import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _kButtonBorderRadius = 25.0;
const double _kButtonLargeHorizontalPadding = 24.0;
const double _kButtonLargeVerticalPadding = 16.0;
const double _kButtonSmallVerticalPadding = 8.0;
const double _kButtonSmallHorizontalPadding = 16.0;
const int _kColorAnimationDuration = 100;
final Color _kButtonColor = EufemiaColors.seaGreenAlt;
final Color _kButtonTappedColor = EufemiaColors.oceanGreen;
final Color _kButtonTextColor = Colors.white;
final Color _kButtonTappedTextColor = Colors.white.withOpacity(0.8);
final Color _kButtonDisabledColor = EufemiaColors.seaGreenAltLight;
final Color _kButtonDisabledTextColor = Colors.white.withOpacity(0.5);

/// A Primary button from the Eufemia Design System.
/// There should only be one on every screen.
class PrimaryButton extends StatefulWidget {
  final String label;
  final ButtonSize size;
  final VoidCallback onPressed;
  final bool enabled;

  /// A Primary button from the Eufemia Design System
  /// There should only be one on every screen
  ///
  /// * [label]: The label of the button
  /// * [size]: The size of the button, given as a [ButtonSize] enum
  /// * [onPressed]: The onPressed callback for button presses
  /// * [enabled]: Whether the button is enabled or not

  const PrimaryButton({
    Key key,
    @required this.label,
    @required this.onPressed,
    this.size = ButtonSize.small,
    this.enabled = true,
  }) : super(key: key);

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> with TickerProviderStateMixin {
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
  void didUpdateWidget(PrimaryButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    initAnimations();
  }

  void initAnimations() {
    colorAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _kColorAnimationDuration),
    );

    buttonColorAnimation = ColorTween(
      begin: enabled ? _kButtonColor : _kButtonDisabledColor,
      end: enabled ? _kButtonTappedColor : _kButtonDisabledColor,
    ).animate(colorAnimationController);

    textColorAnimation = ColorTween(
      begin: enabled ? _kButtonTextColor : _kButtonDisabledTextColor,
      end: enabled ? _kButtonTappedTextColor : _kButtonDisabledTextColor,
    ).animate(colorAnimationController);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Material(
          child: Semantics(
            label: widget.label,
            enabled: enabled,
            button: true,
            value: widget.label,
            child: GestureDetector(
              // onTap: enabled ? _handleTap : null,
              onTapUp: enabled ? _handleTapUp : null,
              onTapDown: enabled ? _handleTapDown : null,
              onTapCancel: enabled ? _handleTapCancel : null,
              child: AnimatedBuilder(
                animation: colorAnimationController,
                builder: (context, _) {
                  return Material(
                    color: buttonColorAnimation.value,
                    borderRadius: BorderRadius.circular(_kButtonBorderRadius),
                    child: Padding(
                      padding: _getContentPadding(),
                      child: Text(
                        widget.label,
                        style: TextStyle(
                          color: textColorAnimation.value,
                          fontSize: _getFontSize(),
                        ),
                      ),
                    ),
                  );
                },
              ),
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
          horizontal: _kButtonSmallHorizontalPadding,
          vertical: _kButtonSmallVerticalPadding,
        );
      case ButtonSize.large:
        return const EdgeInsets.symmetric(
          horizontal: _kButtonLargeHorizontalPadding,
          vertical: _kButtonLargeVerticalPadding,
        );
      default:
        return EdgeInsets.zero;
    }
  }
}