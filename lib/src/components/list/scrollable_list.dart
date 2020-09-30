import 'package:eufemia/palette.dart';
import 'package:eufemia/spacing.dart';
import 'package:eufemia/components.dart';
import 'package:flutter/material.dart';

// TODO (@arnemolland): Refactor to a more simplistic API
/// {@category Components}
/// {@subCategory List}
/// A wrapper around [ListView] with Eufemia-specific customizations.
class ScrollableList extends StatelessWidget {
  /// A label to display above the list.
  final Widget title;

  /// {@macro flutter.widgets.children}
  final List<Widget> children;

  /// If the [ListView] should be shrink-wrapped and not expand.
  final bool shrinkWrap;

  /// If the [children] should have borders between them.
  final bool showBorders;

  /// If a bottom border should be added to the end of the list.
  final bool addBottomBorder;

  /// If the list should become a grid on wider devices.
  final bool adaptive;

  /// Which [ScrollPhysics] to use for the [ListView].
  final ScrollPhysics physics;

  /// The optional [ScrollController] to control the [ListView] with.
  final ScrollController controller;

  /// If adaptive is true, this controls the max amount of children on
  /// the cross axis.
  final int crossAxisCount;

  /// If adaptive is true, this controls the aspect ratio of the grid's children.
  final double gridChildAspectRatio;

  /// [EufemiaSpace] to insert between each child.
  final EufemiaSpace spaceBetween;

  /// {@macro eufemia.spacing.insets}
  final EufemiaInsets padding;

  /// {@macro flutter.rendering.Axis}
  final Axis scrollDirection;

  const ScrollableList({
    Key key,
    this.children,
    this.shrinkWrap = false,
    this.showBorders = true,
    this.physics,
    this.addBottomBorder = true,
    this.title,
    this.controller,
    this.adaptive = false,
    this.crossAxisCount = 2,
    this.gridChildAspectRatio,
    this.spaceBetween,
    this.padding,
    this.scrollDirection = Axis.vertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: adaptive && context.mediaQuery.size.aspectRatio > 1
          ? buildGridView(context)
          : buildListView(context),
    );
  }

  Widget buildGridView(BuildContext context) {
    return GridView(
      padding: EufemiaInsets.allMedium.toEdgeInsets(context: context),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: gridChildAspectRatio,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 8.0,
      ),
      children: children,
      scrollDirection: scrollDirection,
    );
  }

  Widget buildListView(BuildContext context) {
    final palette = EufemiaPalette.of(context);
    return ListView(
      controller: controller,
      physics: physics,
      shrinkWrap: shrinkWrap,
      scrollDirection: scrollDirection,
      children: [
        if (title != null) ...{
          SafeArea(
            bottom: false,
            child: Align(
              alignment: Alignment.centerLeft,
              child: EufemiaPadding(
                padding: EufemiaInsets(
                  left: EufemiaSpace.medium,
                  bottom: EufemiaSpace.small,
                ),
                child: title,
              ),
            ),
          )
        },
        Builder(
          builder: (context) {
            if (showBorders) {
              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 0.5,
                      color: palette.outline,
                    ),
                  ),
                ),
                child: EufemiaColumn(
                  spaceBetween: spaceBetween,
                  children: children,
                  padding: padding,
                ),
              );
            } else {
              return EufemiaColumn(
                spaceBetween: spaceBetween,
                children: children,
                padding: padding,
              );
            }
          },
        ),
      ],
    );
  }
}
