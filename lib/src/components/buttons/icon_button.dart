import 'package:eufemia/eufemia.dart' as eufemia;
import 'package:eufemia/src/style/borders.dart';
import 'package:eufemia/src/utils/button_size.dart';
import 'package:eufemia/src/utils/icon_size.dart';
import 'package:flutter/material.dart';

class EufemiaIconButton extends StatefulWidget {
  final String semanticLabel;
  final IconData icon;
  final ButtonSize size;
  final VoidCallback onPressed;

  const EufemiaIconButton({
    Key key,
    this.semanticLabel,
    this.icon,
    this.size,
    this.onPressed,
  }) : super(key: key);

  @override
  _EufemiaIconButtonState createState() => _EufemiaIconButtonState();
}

class _EufemiaIconButtonState extends State<EufemiaIconButton> {
  Color _fillColor;
  Border _border;
  IconSize _iconSize = IconSize.medium;

  /// Getter for changing []
  bool get enabled => _isWidgetEnabled(widget);

  /// Returns [true] if the given [EufemiaButton] has a non-null [onPressed] callback, else returns [false]
  bool _isWidgetEnabled(EufemiaIconButton widget) => widget.onPressed != null;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _border = EufemiaBorders.invisibleThin;
      _fillColor = eufemia.EufemiaColors.mintGreen;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _border = EufemiaBorders.thin;
      _fillColor = eufemia.EufemiaColors.white;
    });
  }

  void _handleTap() {
    widget.onPressed();
  }

  @override
  void initState() {
    super.initState();
    _border = EufemiaBorders.thin;
    _fillColor = eufemia.EufemiaColors.white;
    if (widget.size == ButtonSize.small) {
      _iconSize = IconSize.small;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: widget.semanticLabel,
      child: GestureDetector(
        onTap: enabled ? _handleTap : null,
        onTapDown: enabled ? _handleTapDown : null,
        onTapUp: enabled ? _handleTapUp : null,
        child: Opacity(
          opacity: enabled ? 1.0 : 0.7,
          child: Container(
            decoration: BoxDecoration(
              color: _fillColor,
              border: _border,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                eufemia.EufemiaIcons.getResponsiveIcon(_iconSize, widget.icon),
                color: eufemia.EufemiaColors.emeraldGreen,
                size: getIconSize(widget.size),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double getIconSize(ButtonSize size) {
    switch (size) {
      case ButtonSize.small:
        return 16.0;
      case ButtonSize.medium:
        return 24.0;
      case ButtonSize.large:
        return 32.0;
      default:
        return 24.0;
    }
  }
}
