import 'package:eufemia/components.dart';
import 'package:eufemia/palette.dart';
import 'package:eufemia/spacing.dart';
import 'package:eufemia/typography.dart';
import 'package:flutter/material.dart';

// TODO (@arnemolland): Refactor to a more simplistic API
class StaticList extends StatelessWidget {
  final Widget title;
  final List<Widget> children;
  final bool showBorders;
  final bool addBottomBorder;
  final bool adaptive;
  final Color backgroundColor;
  final EufemiaSpace spaceBetween;
  final EufemiaInsets padding;

  const StaticList({
    Key key,
    this.children,
    this.showBorders = true,
    this.backgroundColor,
    this.addBottomBorder = true,
    this.title,
    this.adaptive = false,
    this.spaceBetween,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final typography = EufemiaTypography.of(context);
    final palette = EufemiaPalette.of(context);

    return EufemiaColumn(
      padding: padding,
      mainAxisSize: MainAxisSize.min,
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
                child: DefaultTextStyle(
                  style:
                      typography.styles.subheadEmphasized.toTextStyle(context),
                  child: title,
                ),
              ),
            ),
          ),
        },
        if (showBorders) ...{
          Container(
            decoration: BoxDecoration(
              color: backgroundColor ?? palette.card,
              border: Border(
                top: BorderSide(
                  width: 0.5,
                  color: palette.outline,
                ),
              ),
            ),
            child: buildList(context),
          )
        } else ...{
          Container(
            color: backgroundColor ?? palette.card,
            child: buildList(context),
          ),
        },
      ],
    );
  }

  Widget buildList(BuildContext context) {
    if (adaptive && context.mediaQuery.size.aspectRatio > 1) {
      final spacedChildren =
          spaceBetween != null && spaceBetween != EufemiaSpace.none
              ? children.spaced(spaceBetween)
              : children;

      return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 3,
        ),
        itemBuilder: (context, index) => spacedChildren[index],
      );
    } else {
      return EufemiaColumn(
        children: children,
        spaceBetween: spaceBetween,
        mainAxisSize: MainAxisSize.min,
      );
    }
  }
}
