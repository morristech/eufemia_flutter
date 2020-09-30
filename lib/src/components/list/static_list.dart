import 'package:eufemia/components.dart';
import 'package:eufemia/palette.dart';
import 'package:eufemia/spacing.dart';
import 'package:eufemia/typography.dart';
import 'package:flutter/material.dart';

// TODO (@arnemolland): Refactor to a more simplistic API
/// {@category Components}
/// {@subCategory List}
/// A static (non-scrollable) list from the Eufemia design system.
class StaticList extends StatelessWidget {
  /// A label to display above the list.
  final Widget title;

  /// {@macro flutter.widgets.children}
  final List<Widget> children;

  /// If the [children] should have borders between them.
  final bool showBorders;

  /// If a bottom border should be added to the end of the list.
  final bool addBottomBorder;

  /// If the list should become a grid on wider devices.
  final bool adaptive;

  /// A background color, if any.
  final Color backgroundColor;

  /// [EufemiaSpace] to insert between each child.
  final EufemiaSpace spaceBetween;

  /// {@macro eufemia.spacing.insets}
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
