import 'package:eufemia/eufemia.dart' as eufemia;
import 'package:eufemia/src/style/borders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EufemiaGridTile extends StatelessWidget {
  final Widget title;
  final Widget subtitle;
  final Widget icon;
  final Color color;
  final bool filled;
  final String semanticsLabel;
  final VoidCallback onTap;

  const EufemiaGridTile({
    Key key,
    this.color = eufemia.EufemiaColors.seagreenAlt,
    this.filled = false,
    this.title,
    this.subtitle,
    this.icon,
    this.semanticsLabel,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticsLabel,
      child: GestureDetector(
        onTap: onTap,
        child: GridTile(
          child: Container(
            decoration: BoxDecoration(
              color: filled ? color : null,
              border: filled
                  ? EufemiaBorders.invisible
                  : Border.all(
                      color: color,
                      width: 1.5,
                    ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...{icon},
                if (title != null) ...{title},
                if (subtitle != null) ...{subtitle},
              ],
            ),
          ),
        ),
      ),
    );
  }
}
