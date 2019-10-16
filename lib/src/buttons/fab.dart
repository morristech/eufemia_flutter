import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _kButtonShadowSpreadRadius = 1.0;
const double _kButtonShadowBlurRadius = 16.0;
const double _kIconSize = 24.0;
const int _kColorAnimationDuration = 100;
final Color _kButtonColor = EufemiaColors.seaGreenAlt;
final Color _kButtonDisabledColor = EufemiaColors.seaGreenAltLight;
final Color _kButtonTappedColor = EufemiaColors.seaGreenAltDark;
final Color _kButtonShadowColor = EufemiaColors.seaGreenAltShadow;
final Color _kButtonIconColor = Colors.white;
final Color _kButtonTappedIconColor = Colors.white.withOpacity(0.8);
final Color _kButtonDisabledIconColor = Colors.white.withOpacity(0.5);
final Offset _kButtonShadowOffset = Offset(0.0, 8.0);

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
      duration: Duration(milliseconds: _kColorAnimationDuration),
    );

    buttonColorAnimation = ColorTween(
      begin: enabled ? _kButtonColor : _kButtonDisabledColor,
      end: enabled ? _kButtonTappedColor : _kButtonDisabledColor,
    ).animate(colorAnimationController);

    iconColorAnimation = ColorTween(
      begin: enabled ? _kButtonIconColor : _kButtonDisabledIconColor,
      end: enabled ? _kButtonTappedIconColor : _kButtonDisabledIconColor,
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
                  color: buttonColorAnimation.value,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: _kButtonShadowColor,
                      spreadRadius: _kButtonShadowSpreadRadius,
                      blurRadius: _kButtonShadowBlurRadius,
                      offset: _kButtonShadowOffset,
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: IconTheme(
                      data: IconThemeData(
                        color: iconColorAnimation.value,
                        size: _kIconSize,
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
