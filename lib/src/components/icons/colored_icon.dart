import 'package:eufemia/palette.dart';
import 'package:flutter/widgets.dart';
import 'package:eufemia/components.dart';

/// A wrapper for custom SVG icons
class ColoredIcon extends StatelessWidget {
  /// The icon to display
  final Widget icon;

  /// The optional background color of the icon
  final Color backgroundColor;

  /// The icon color
  final Color color;

  /// Size of the icon, defaults to [32.0]
  final double size;

  final BorderRadiusGeometry borderRadius;

  /// Constructs a [ColoredIcon] object
  const ColoredIcon({
    Key key,
    this.color,
    this.backgroundColor,
    this.size = 32.0,
    this.icon,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);

    return Container(
      padding:
          EdgeInsets.all(hasBackground ? (context.cupertino ? 4.0 : 6.0) : 0.0),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: hasBackground ? backgroundColor : null,
        borderRadius: borderRadius ??
            (context.cupertino
                ? BorderRadius.circular(8.0)
                : BorderRadius.circular(100)),
      ),
      child: SizedBox(
        width: 24.0,
        height: 24.0,
        child: Center(
          child: IconTheme(
            data: IconThemeData(
              color:
                  color ?? (hasBackground ? palette.icon : palette.secondary),
              size: 18.0,
            ),
            child: icon,
          ),
        ),
      ),
    );
  }

  bool get hasBackground => backgroundColor != null;
}
