import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class StaticList extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool showBorders;
  final bool addBottomBorder;
  final bool adaptive;
  final EdgeInsets customPadding;
  final Color backgroundColor;
  final EufemiaSpace spaceBetween;
  final EufemiaInsets padding;

  const StaticList({
    Key key,
    this.children,
    this.customPadding,
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
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null) ...{
          SafeArea(
            bottom: false,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  bottom: 8.0,
                ),
                child: Text(
                  title,
                  style:
                      typography.styles.subheadEmphasized.toTextStyle(context),
                ),
              ),
            ),
          ),
        },
        if (showBorders) ...{
          Container(
            decoration: BoxDecoration(
              color: backgroundColor ?? context.theme.cardColor,
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
            color: backgroundColor ?? context.theme.cardColor,
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
        padding: padding,
        mainAxisSize: MainAxisSize.min,
      );
    }
  }
}
