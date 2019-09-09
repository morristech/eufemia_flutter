import 'package:eufemia/eufemia.dart' as eufemia;
import 'package:eufemia/src/style/borders.dart';
import 'package:eufemia/src/style/constants.dart';
import 'package:eufemia/src/utils/button_size.dart';
import 'package:eufemia/src/utils/icon_position.dart';
import 'package:eufemia/src/utils/icon_size.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EufemiaRawButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color backgroundHoverColor;
  final Color backgroundPressedColor;
  final Color foregroundColor;
  final Color foregroundHoverColor;
  final Color foregroundPressedColor;
  final Border border;
  final Border hoverBorder;
  final Border pressedBorder;
  final bool enabled;
  final IconData icon;
  final IconSize iconSize;
  final Position iconPosition;
  final double disabledOpacity;
  final ButtonSize size;
  final Duration animationDuration;

  const EufemiaRawButton({
    Key key,
    this.onPressed,
    this.enabled,
    this.icon,
    this.iconPosition = Position.right,
    this.backgroundColor = eufemia.EufemiaColors.seaGreen,
    this.disabledOpacity = 0.5,
    this.border,
    this.text,
    this.animationDuration = const Duration(milliseconds: 50),
    this.hoverBorder,
    this.pressedBorder,
    this.foregroundColor = eufemia.EufemiaColors.white,
    Color foregroundHoverColor,
    Color foregroundPressedColor,
    Color backgroundHoverColor,
    Color backgroundPressedColor,
    this.iconSize = IconSize.small,
    this.size = ButtonSize.medium,
  })  : foregroundHoverColor = foregroundHoverColor ?? foregroundColor,
        foregroundPressedColor = foregroundPressedColor ?? foregroundColor,
        backgroundHoverColor = backgroundHoverColor ?? backgroundColor,
        backgroundPressedColor = backgroundPressedColor ?? backgroundColor,
        super(key: key);

  @override
  _EufemiaRawButtonState createState() => _EufemiaRawButtonState();
}

class _EufemiaRawButtonState extends State<EufemiaRawButton> {
  Color _backgroundColor;
  Color _foregroundColor;
  Border _border;
  bool _hovering = false;
  double _paddingFactor;

  /// Getter for changing [enabled] status
  bool get enabled => _isWidgetEnabled(widget);

  /// Returns [true] if the given [EufemiaRawButton] has a non-null [onPressed] callback, else returns [false]
  bool _isWidgetEnabled(EufemiaRawButton widget) => widget.onPressed != null;

  /// Redirects the [PointerEnterEvent] event to a handler function
  void _handleMouseEnter(PointerEnterEvent event) => _handleHoverChange(true);

  /// Redirects the [PointerExitEvent] event to a handler function
  void _handleMouseExit(PointerExitEvent event) => _handleHoverChange(false);

  /// Handles a change in the hovering state
  void _handleHoverChange(bool hovering) {
    if (_hovering != hovering) {
      _hovering = hovering;
    }
    if (hovering) {
      setState(() {
        _backgroundColor = widget.backgroundHoverColor;
        _foregroundColor = widget.foregroundHoverColor;
        _border = widget.hoverBorder;
      });
    } else {
      setState(() {
        _backgroundColor = widget.backgroundColor;
        _foregroundColor = widget.foregroundColor;
        _border = widget.border;
      });
    }
  }

  void _handleTap() {
    widget.onPressed();
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _backgroundColor = widget.backgroundPressedColor;
      _foregroundColor = widget.foregroundPressedColor;
      _border = widget.pressedBorder;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _backgroundColor = widget.backgroundColor;
      _foregroundColor = widget.foregroundColor;
      _border = widget.border;
    });
  }

  /// Orders the children after on the given [iconPosition]
  List<Widget> _buildChildren() {
    List<Widget> children = [
      Text(
        widget.text,
        style: TextStyle(color: _foregroundColor),
      ),
      // Padding
      SizedBox(width: 8.0),
      if (widget.icon != null) ...{_buildIcon()},
    ];

    switch (widget.iconPosition) {
      case Position.left:
        return children.reversed.toList();
      case Position.right:
        return children;
    }

    // Nevers reaches this point
    return children;
  }

  /// Builds the icon with responsive sizing, color and resolution
  Widget _buildIcon() {
    return Icon(
      eufemia.EufemiaIcons.getResponsiveIcon(
        widget.iconSize,
        widget.icon,
      ),
      size: getIconSize(widget.iconSize),
      color: _foregroundColor,
    );
  }

  /// Getter for content padding that depends on properties like [iconPosition]
  /// and [icon] to adjust for sizing that may vary
  EdgeInsets get padding => EdgeInsets.only(
        left:
            widget.iconPosition == Position.left ? 12.0 * _paddingFactor : 20.0,
        top: widget.icon != null ? 8.0 : 10.0,
        right: widget.iconPosition == Position.right
            ? 12.0 * _paddingFactor
            : 20.0,
        bottom: widget.icon != null ? 8.0 : 10.0,
      );

  double getPaddingFactor(ButtonSize size) {
    switch (size) {
      case ButtonSize.medium:
        return 1.0;
      case ButtonSize.large:
        return 1.5;
      default:
        return 1.0;
    }
  }

  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.backgroundColor;
    _foregroundColor = widget.foregroundColor;
    _border = widget.border;
    _paddingFactor = getPaddingFactor(widget.size);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: enabled ? _handleMouseEnter : null,
      onExit: enabled ? _handleMouseExit : null,
      child: GestureDetector(
        onTapDown: enabled ? _handleTapDown : null,
        onTapUp: enabled ? _handleTapUp : null,
        onTap: enabled ? _handleTap : null,
        child: Opacity(
          opacity: enabled ? 1.0 : 0.7,
          child: AnimatedContainer(
            curve: Curves.ease,
            padding: padding,
            duration: widget.animationDuration,
            decoration: BoxDecoration(
              color: _backgroundColor,
              border: _border ?? EufemiaBorders.invisible,
              borderRadius:
                  BorderRadius.circular(EufemiaConstants.borderRadius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: _buildChildren(),
            ),
          ),
        ),
      ),
    );
  }
}
