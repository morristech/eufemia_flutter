import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _buttonBorderRadius = 4.0;
const double _buttonPadding = 4.0;
const int _colorAnimationDuration = 100;
final Color _buttonColor = Colors.transparent;
final Color _buttonTappedColor = EufemiaColors.oceanGreen.withOpacity(0.1);
final Color _buttonTextColor = EufemiaColors.seaGreenAlt;
final Color _buttonTappedTextColor = EufemiaColors.seaGreenAlt.withOpacity(0.8);
final Color _buttonDisabledColor = Colors.transparent;
final Color _buttonDisabledTextColor = EufemiaColors.seaGreenAltLight;

// Dark mode
final Color _buttonDarkColor = Colors.transparent;
final Color _buttonDarkTappedColor = EufemiaColors.mintGreen.withOpacity(0.1);
final Color _buttonDarkTextColor = EufemiaColors.mintGreen;
final Color _buttonDarkTappedTextColor =
    EufemiaColors.mintGreen.withOpacity(0.8);
final Color _buttonDarkDisabledColor = Colors.transparent;
final Color _buttonDarkDisabledTextColor =
    EufemiaColors.mintGreen.withOpacity(0.5);

/// A text button from the Eufemia Design System
class TextButton extends StatefulWidget {
  final String label;
  final ButtonSize size;
  final bool emphasized;
  final bool enabled;
  final VoidCallback onPressed;
  final Color color;
  final Color tappedColor;
  final TextStyle style;

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
    this.size = ButtonSize.large,
    this.enabled = true,
    this.onPressed,
    this.emphasized = false,
    this.color,
    this.tappedColor,
    this.style,
  }) : super(key: key);

  @override
  _TextButtonState createState() => _TextButtonState();

  TextButton copyWith(
      {Color color, Color tappedColor, bool emphasized, ButtonSize size}) {
    return TextButton(
      label: label,
      size: size ?? this.size,
      enabled: enabled,
      onPressed: onPressed,
      emphasized: emphasized ?? this.emphasized,
      color: color ?? this.color,
      tappedColor: tappedColor ?? this.tappedColor,
      style: style,
    );
  }
}

class _TextButtonState extends State<TextButton> with TickerProviderStateMixin {
  Animation<Color> buttonColorAnimation;
  Animation<Color> textColorAnimation;
  Animation<Color> buttonDarkColorAnimation;
  Animation<Color> textDarkColorAnimation;
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
      duration: Duration(milliseconds: _colorAnimationDuration),
    );

    buttonColorAnimation = ColorTween(
      begin: enabled ? _buttonColor : _buttonDisabledColor,
      end: enabled ? _buttonTappedColor : _buttonDisabledColor,
    ).animate(colorAnimationController);

    textColorAnimation = ColorTween(
      begin:
          enabled ? widget.color ?? _buttonTextColor : _buttonDisabledTextColor,
      end: enabled
          ? widget.tappedColor ?? _buttonTappedTextColor
          : _buttonDisabledTextColor,
    ).animate(colorAnimationController);

    buttonDarkColorAnimation = ColorTween(
      begin: enabled ? _buttonDarkColor : _buttonDarkDisabledColor,
      end: enabled ? _buttonDarkTappedColor : _buttonDarkDisabledColor,
    ).animate(colorAnimationController);

    textDarkColorAnimation = ColorTween(
      begin: enabled
          ? widget.color ?? _buttonDarkTextColor
          : _buttonDarkDisabledTextColor,
      end: enabled
          ? widget.tappedColor ?? _buttonDarkTappedTextColor
          : _buttonDarkDisabledTextColor,
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
        child: AnimatedBuilder(
          animation: colorAnimationController,
          builder: (context, _) {
            return Container(
              decoration: BoxDecoration(
                color: context.bright
                    ? buttonColorAnimation.value
                    : buttonDarkColorAnimation.value,
                borderRadius: BorderRadius.circular(_buttonBorderRadius),
              ),
              child: Padding(
                padding: const EdgeInsets.all(_buttonPadding),
                child: Text(
                  widget.label,
                  style: widget.style ??
                      TextStyle(
                        color: context.bright
                            ? textColorAnimation.value
                            : textDarkColorAnimation.value,
                        fontSize: _getFontSize(),
                        fontWeight: widget.emphasized ? FontWeight.bold : null,
                        height: 1.2,
                      ),
                ),
              ),
            );
          },
        ),
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
