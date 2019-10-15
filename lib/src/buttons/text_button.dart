import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _kButtonBorderRadius = 4.0;
const double _kButtonPadding = 4.0;
const int _kColorAnimationDuration = 100;
final Color _kButtonColor = Colors.transparent;
final Color _kButtonTappedColor = EufemiaColors.oceanGreen.withOpacity(0.1);
final Color _kButtonTextColor = EufemiaColors.seaGreenAlt;
final Color _kButtonTappedTextColor =
    EufemiaColors.seaGreenAlt.withOpacity(0.8);
final Color _kButtonDisabledColor = Colors.transparent;
final Color _kButtonDisabledTextColor = EufemiaColors.seaGreenAltLight;

class TextButton extends StatefulWidget {
  final String text;
  final ButtonSize size;
  final bool emphasized;
  final bool enabled;
  final VoidCallback onTap;
  final Color color;
  final Color tappedColor;

  const TextButton(
      {Key key,
      @required this.text,
      @required this.size,
      this.enabled = true,
      this.onTap,
      this.emphasized = false,
      this.color,
      this.tappedColor})
      : super(key: key);

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
    colorAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _kColorAnimationDuration),
    );

    buttonColorAnimation = ColorTween(
      begin: enabled ? _kButtonColor : _kButtonDisabledColor,
      end: enabled ? _kButtonTappedColor : _kButtonDisabledColor,
    ).animate(colorAnimationController);

    textColorAnimation = ColorTween(
      begin: enabled
          ? widget.color ?? _kButtonTextColor
          : _kButtonDisabledTextColor,
      end: enabled
          ? widget.tappedColor ?? _kButtonTappedTextColor
          : _kButtonDisabledTextColor,
    ).animate(colorAnimationController);
  }

  @override
  void dispose() {
    colorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.text,
      enabled: enabled,
      button: true,
      value: widget.text,
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
                  widget.text,
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

  bool get enabled => widget.onTap != null || widget.enabled;

  void _handleTapDown(TapDownDetails details) {
    colorAnimationController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    colorAnimationController.reverse(from: 1.0);
    if (widget.onTap != null) {
      widget.onTap();
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
