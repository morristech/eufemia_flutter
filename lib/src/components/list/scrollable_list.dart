import 'package:eufemia/palette.dart';
import 'package:eufemia/spacing.dart';
import 'package:eufemia/components.dart';
import 'package:flutter/material.dart';

// TODO (@arnemolland): Refactor to a more simplistic API
class ScrollableList extends StatelessWidget {
  final Widget title;
  final List<Widget> children;
  final bool shrinkWrap;
  final bool showBorders;
  final bool addBottomBorder;
  final bool adaptive;
  final ScrollPhysics physics;
  final ScrollController controller;
  final int crossAxisCount;
  final double gridChildAspectRatio;
  final EufemiaSpace spaceBetween;
  final EufemiaInsets padding;
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
