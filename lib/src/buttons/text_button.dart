import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _kButtonBorderRadius = 4.0;
const double _kButtonPadding = 4.0;
const int _kColorAnimationDuration = 100;
final Color _kButtonColor = Colors.transparent;
final Color _kButtonTappedColor = EufemiaColors.oceanGreen.withOpacity(0.1);
final Color _kButtonTextColor = EufemiaColors.seaGreenAlt;
final Color _kButtonTappedTextColor = EufemiaColors.seaGreenAlt.withOpacity(0.8);
final Color _kButtonDisabledColor = Colors.transparent;
final Color _kButtonDisabledTextColor = EufemiaColors.seaGreenAltLight;

/// A text button from the Eufemia Design System
class TextButton extends StatefulWidget {
  final String label;
  final ButtonSize size;
  final bool emphasized;
  final bool enabled;
  final VoidCallback onPressed;
  final Color color;
  final Color tappedColor;

  /// A text button from the Eufemia Design System
  ///
  /// * [label]: The label of the button
  /// * [size]: The size of the button, given as a [ButtonSize] enum
  /// * [emphasized]: If [true], the label font is set to bold
  /// * [enabled]: Whether the button is enabled or not
  /// * [onPressed]: The onPressed callback for button presses
  /// * [color]: The color of the button
  /// * [tappedColor]: The color of the button when tapped
  const TextButton({
    Key key,
    @required this.label,
    this.size = ButtonSize.small,
    this.enabled = true,
    this.onPressed,
    this.emphasized = false,
    this.color,
    this.tappedColor,
  }) : super(key: key);

  @override
  _TextButtonState createState() => _TextButtonState();
}

class _TextButtonState extends State<TextButton> with TickerProviderStateMixin {
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
  void didUpdateWidget(TextButton oldWidget) {
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
      begin: enabled ? widget.color ?? _kButtonTextColor : _kButtonDisabledTextColor,
      end: enabled ? widget.tappedColor ?? _kButtonTappedTextColor : _kButtonDisabledTextColor,
    ).animate(colorAnimationController);
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.label,
      enabled: enabled,
      button: true,
      value: widget.label,
      child: GestureDetector(
        onTapDown: enabled ? _handleTapDown : null,
        onTapUp: enabled ? _handleTapUp : null,
        onTapCancel: enabled ? _handleTapCancel : null,
        child: Center(
            child: AnimatedBuilder(
          animation: colorAnimationController,
          builder: (context, _) {
            return Container(
              decoration: BoxDecoration(
                color: buttonColorAnimation.value,
                borderRadius: BorderRadius.circular(_kButtonBorderRadius),
              ),
              child: Padding(
                padding: const EdgeInsets.all(_kButtonPadding),
                child: Text(
                  widget.label,
                  style: TextStyle(
                    color: textColorAnimation.value,
                    fontSize: _getFontSize(),
                    fontWeight: widget.emphasized ? FontWeight.bold : null,
                  ),
                ),
              ),
            );
          },
        )),
      ),
    );
  }

  bool get enabled => widget.onPressed != null && widget.enabled;

  void _handleTapDown(TapDownDetails details) {
    colorAnimationController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    colorAnimationController.reverse(from: 1.0);
    if (widget.onPressed != null) {
      widget.onPressed();
    }
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
}
