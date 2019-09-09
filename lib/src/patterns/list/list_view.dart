import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const _defaultColors = [
  EufemiaColors.white,
  EufemiaColors.mintGreen,
  EufemiaColors.mintGreenAlt
];

class EufemiaListView extends StatelessWidget {
  final List<Widget> children;
  final List<Color> colors;
  final Color backgroundColor;
  final EdgeInsets padding;
  final bool differingColors;
  final Alignment alignment;
  final double spacing;
  const EufemiaListView({
    Key key,
    this.children,
    this.colors = _defaultColors,
    this.padding,
    this.backgroundColor,
    this.differingColors = false,
    this.alignment = Alignment.center,
    this.spacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? Theme.of(context).canvasColor,
      child: ListView.builder(
        padding: padding ?? EdgeInsets.zero,
        itemCount: children.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              top: index == 0 ? 0 : spacing ?? 0,
            ),
            child: Material(
              color: differingColors
                  ? colors[index % colors.length]
                  : Colors.transparent,
              child: Align(
                alignment: alignment,
                child: children[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
