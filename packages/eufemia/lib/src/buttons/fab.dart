import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _buttonShadowSpreadRadius = 1.0;
const double _buttonShadowBlurRadius = 16.0;
const double _iconSize = 24.0;
const int _colorAnimationDuration = 100;

// Light mode
final Color _buttonColor = EufemiaColors.seaGreen;
final Color _buttonDisabledColor = Color(0xFF80C1C1);
final Color _buttonTappedColor = Color(0xFF006C6F);
final Color _buttonShadowColor = EufemiaColors.seaGreenAltShadow;
final Color _buttonIconColor = Colors.white;
final Color _buttonTappedIconColor = Colors.white.withOpacity(0.8);
final Color _buttonDisabledIconColor = Colors.white.withOpacity(0.5);

// Dark mode
final Color _buttonDarkColor = EufemiaColors.mintGreen;
final Color _buttonDarkDisabledColor = EufemiaColors.mintGreen.withOpacity(0.8);
final Color _buttonDarkTappedColor = EufemiaColors.mintGreen.withOpacity(0.8);
final Color _buttonDarkShadowColor =
    EufemiaColors.mintGreenAlt.withOpacity(0.2);
final Color _buttonDarkIconColor = EufemiaColors.emeraldGreen;
final Color _buttonDarkTappedIconColor =
    EufemiaColors.emeraldGreen.withOpacity(0.8);
final Color _buttonDarkDisabledIconColor =
    EufemiaColors.emeraldGreen.withOpacity(0.5);

final Offset _buttonShadowOffset = Offset(0.0, 8.0);

/// A floating action button
class FAB extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final String semanticLabel;
  final dynamic semanticValue;
  final bool enabled;

  /// A floating action button
  ///
  /// * [child]: The icon of the button
  /// * [onPressed]: The onPressed callback for button presses
  /// * [semanticLabel]: Accessibility label for this button
  /// * [semanticValue]: Accessbility value, if any value is associated with this button
  /// * [enabled]: Whether the button is enabled or not
  FAB({
    Key key,
    @required this.child,
    @required this.onPressed,
    this.semanticLabel,
    this.semanticValue,
    this.enabled = true,
  }) : super(key: key);

  @override
  _FABState createState() => _FABState();
}

class _FABState extends State<FAB> with TickerProviderStateMixin {
  Animation<Color> buttonColorAnimation;
  Animation<Color> iconColorAnimation;
  Animation<Color> buttonDarkColorAnimation;
  Animation<Color> iconDarkColorAnimation;
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    colorAnimationController.forward();
  }

  @override
  void didUpdateWidget(FAB oldWidget) {
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

    iconColorAnimation = ColorTween(
      begin: enabled ? _buttonIconColor : _buttonDisabledIconColor,
      end: enabled ? _buttonTappedIconColor : _buttonDisabledIconColor,
    ).animate(colorAnimationController);

    buttonDarkColorAnimation = ColorTween(
      begin: enabled ? _buttonDarkColor : _buttonDarkDisabledColor,
      end: enabled ? _buttonDarkTappedColor : _buttonDarkDisabledColor,
    ).animate(colorAnimationController);

    iconDarkColorAnimation = ColorTween(
      begin: enabled ? _buttonDarkIconColor : _buttonDarkDisabledIconColor,
      end: enabled ? _buttonDarkTappedIconColor : _buttonDarkDisabledIconColor,
    ).animate(colorAnimationController);
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticLabel,
      enabled: enabled,
      button: true,
      value: widget.semanticValue,
      child: GestureDetector(
        onTapDown: enabled ? _handleTapDown : null,
        onTapUp: enabled ? _handleTapUp : null,
        onTapCancel: enabled ? _handleTapCancel : null,
        child: AnimatedBuilder(
          animation: colorAnimationController,
          builder: (context, _) {
            return FittedBox(
              child: Container(
                decoration: BoxDecoration(
                  color: context.bright
                      ? buttonColorAnimation.value
                      : buttonDarkColorAnimation.value,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: context.bright
                          ? _buttonShadowColor
                          : _buttonDarkShadowColor,
                      spreadRadius: _buttonShadowSpreadRadius,
                      blurRadius: _buttonShadowBlurRadius,
                      offset: _buttonShadowOffset,
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: IconTheme(
                      data: IconThemeData(
                        color: context.bright
                            ? iconColorAnimation.value
                            : iconDarkColorAnimation.value,
                        size: _iconSize,
                      ),
                      child: widget.child,
                    ),
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
    widget.onPressed();
  }

  void _handleTapCancel() {
    colorAnimationController.reverse();
  }
}
