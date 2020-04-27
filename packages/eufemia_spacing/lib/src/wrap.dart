import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'insets.dart';
import 'padding.dart';
import 'space.dart';
import 'spacing.dart';

class EufemiaWrap extends StatelessWidget {
  final List<Widget> children;
  final Axis direction;
  final WrapAlignment alignment;
  final EufemiaSpace runSpacing;
  final EufemiaSpace spacing;
  final EufemiaInsets padding;
  final WrapAlignment runAlignment;
  final WrapCrossAlignment crossAxisAlignment;
  final TextDirection textDirection;
  final VerticalDirection verticalDirection;

  const EufemiaWrap({
    Key key,
    this.direction = Axis.horizontal,
    this.alignment = WrapAlignment.start,
    this.runSpacing = EufemiaSpace.none,
    this.spacing = EufemiaSpace.none,
    this.padding,
    this.runAlignment = WrapAlignment.start,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = EufemiaSpacing.of(context);
    Widget result = Wrap(
      direction: direction,
      alignment: alignment,
      spacing: spacing.toPoints(data: data),
      crossAxisAlignment: crossAxisAlignment,
      runAlignment: runAlignment,
      runSpacing: runSpacing.toPoints(data: data),
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      children: children,
    );

    if (padding != null) {
      result = EufemiaPadding(
        padding: padding,
        child: result,
      );
    }

    return Provider.value(value: direction, child: result);
  }
}
