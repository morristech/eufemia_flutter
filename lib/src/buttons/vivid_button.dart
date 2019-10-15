import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _kButtonBorderRadius = 25.0;
const double _kButtonLargeHorizontalPadding = 24.0;
const double _kButtonLargeVerticalPadding = 16.0;
const double _kButtonSmallVerticalPadding = 8.0;
const double _kButtonSmallHorizontalPadding = 16.0;
const int _kColorAnimationDuration = 100;
final Color _kButtonColor = EufemiaColors.signalYellow;
final Color _kButtonTappedColor = EufemiaColors.signalYellowDark;
final Color _kButtonTextColor = EufemiaColors.oceanGreen;
final Color _kButtonTappedTextColor = EufemiaColors.oceanGreen.withOpacity(0.8);
final Color _kButtonDisabledColor = EufemiaColors.signalYellow.withOpacity(0.5);
final Color _kButtonDisabledTextColor = EufemiaColors.oceanGreen.withOpacity(0.5);

/// A vivid button from the Eufemia Design System
class VividButton extends StatefulWidget {
  final String label;
  final ButtonSize size;
  final VoidCallback onTap;

  /// A vivid button from the Eufemia Design System
  /// * [label]: The label of this button
  /// * [size]: The size of this button, given as a [ButtonSize] enum
  /// * [onTap]: The onTap callback for button presses
  const VividButton({
    Key key,
    @required this.label,
    @required this.size,
    @required this.onTap,
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
