import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _kButtonBorderRadius = 25.0;
const double _kButtonLargeHorizontalPadding = 24.0;
const double _kButtonLargeVerticalPadding = 16.0;
const double _kButtonSmallVerticalPadding = 8.0;
const double _kButtonSmallHorizontalPadding = 16.0;
const double _kButtonBorderWidth = 1.0;
const int _kColorAnimationDuration = 100;
final Color _kButtonColor = Colors.white;
final Color _kButtonBorderColor = EufemiaColors.seaGreenAlt;
final Color _kButtonTappedColor = EufemiaColors.softGray;
final Color _kButtonTextColor = EufemiaColors.seaGreenAlt;
final Color _kButtonTappedTextColor =
    EufemiaColors.seaGreenAlt.withOpacity(0.8);
final Color _kButtonDisabledColor = Colors.transparent;
final Color _kButtonDisabledTextColor = EufemiaColors.seaGreenAltLight;
final Color _kButtonDisabledBorderColor =
    EufemiaColors.seaGreenAlt.withOpacity(0.5);

class SecondaryButton extends StatefulWidget {
  final String text;
  final ButtonSize size;
  final VoidCallback onTap;

  const SecondaryButton({
    Key key,
    @required this.text,
    @required this.size,
    @required this.onTap,
  }) : super(key: key);

  @override
  _SecondaryButtonState createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton>
    with TickerProviderStateMixin {
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
      begin: enabled ? _kButtonTextColor : _kButtonDisabledTextColor,
      end: enabled ? _kButtonTappedTextColor : _kButtonDisabledTextColor,
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
                border: Border.all(
                  color: enabled
                      ? _kButtonBorderColor
                      : _kButtonDisabledBorderColor,
                  width: _kButtonBorderWidth,
                ),
              ),
              child: Padding(
                padding: _getContentPadding(),
                child: Text(
                  widget.text,
                  style: TextStyle(
                    color: textColorAnimation.value,
                    fontSize: _getFontSize(),
                  ),
                ),
              ),
            );
          },
        )),
      ),
    );
  }

  bool get enabled => widget.onTap != null;

  void _handleTapDown(TapDownDetails details) {
    colorAnimationController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    colorAnimationController.reverse(from: 1.0);
    widget.onTap();
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
