import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'insets.dart';
import 'padding.dart';
import 'space.dart';
import 'spacing.dart';

class EufemiaWrap extends StatelessWidget {
  /// {@template flutter.widgets.children}
  /// The widgets below this widget in the tree.
  ///
  /// If this list is going to be mutated, it is usually wise to put a [Key] on
  /// each of the child widgets, so that the framework can match old
  /// configurations to new configurations and maintain the underlying render
  /// objects.
  ///
  /// Also, a [Widget] in Flutter is immutable, so directly modifying the
  /// [children] such as `someMultiChildRenderObjectWidget.children.add(...)` or
  /// as the example code below will result in incorrect behaviors. Whenever the
  /// children list is modified, a new list object should be provided.
  /// {@endtemplate}
  final List<Widget> children;

  /// {@template flutter.rendering.Axis}
  /// The two cardinal directions in two dimensions. The axis is always relative to the current coordinate space.
  /// This means, for example, that a horizontal axis might actually be diagonally from top right to bottom left,
  /// due to some local Transform applied to the scene.
  /// {@endtemplate}
  final Axis direction;

  /// {@template flutter.rendering.WrapAlignment}
  /// How Wrap should align objects. Used both to align children within a run in the main axis as well as to align
  /// the runs themselves in the cross axis.
  /// {@endtemplate}
  final WrapAlignment alignment;

  final EufemiaSpace runSpacing;
  final EufemiaSpace spacing;

  /// {@macro eufemia.spacing.insets}
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
