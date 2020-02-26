import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const _iconSize = 32.0;

/// A wrapper for custom SVG icons
class ColoredIcon extends StatelessWidget {
  /// The asset path
  final String customAsset;

  /// The icon to display
  final IconData icon;

  /// The optional background color of the icon
  final Color backgroundColor;

  /// The icon color
  final Color color;

  /// Size of the icon, defaults to [32.0]
  final double size;

  /// Constructs a [ColoredIcon] object
  const ColoredIcon({
    Key key,
    this.color,
    this.customAsset,
    this.backgroundColor,
    this.size = _iconSize,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
          _hasBackground ? (context.cupertino ? 4.0 : 6.0) : 0.0),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: _hasBackground ? backgroundColor : null,
        borderRadius: context.cupertino
            ? BorderRadius.circular(8.0)
            : BorderRadius.circular(100),
      ),
      child: SizedBox(
        width: 24.0,
        height: 24.0,
        child: Center(
          child: customAsset != null
              ? SvgPicture.asset(
                  customAsset,
                  color: color ??
                      (_hasBackground ? null : EufemiaColors.seaGreenAlt),
                )
              : Icon(
                  icon,
                  size: 18.0,
                  color: color ??
                      (_hasBackground
                          ? Colors.white
                          : EufemiaColors.seaGreenAlt),
                ),
        ),
      ),
    );
  }

  bool get _hasBackground => backgroundColor != null;
}
