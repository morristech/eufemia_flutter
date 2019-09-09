import 'package:eufemia/src/style/borders.dart';
import 'package:eufemia/src/style/colors.dart';
import 'package:flutter/material.dart';

class EufemiaSection extends StatelessWidget {
  final Widget child;
  final bool spacing;
  final bool dividers;
  final Color color;

  const EufemiaSection({
    Key key,
    @required this.child,
    this.spacing = true,
    this.color = EufemiaColors.mintGreen12,
    this.dividers = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 36.0,
        vertical: spacing ? 24.0 : 0.0,
      ),
      decoration: BoxDecoration(
        color: color,
        border: dividers
            ? Border(
                top: EufemiaBorders.divider,
                bottom: EufemiaBorders.divider,
              )
            : null,
      ),
      width: double.infinity,
      child: Container(
        child: child,
      ),
    );
  }
}
