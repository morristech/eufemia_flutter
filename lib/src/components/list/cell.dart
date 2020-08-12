import 'package:eufemia/components.dart';
import 'package:eufemia/palette.dart';
import 'package:eufemia/spacing.dart';
import 'package:eufemia/typography.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Cell extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget trailing;
  final Widget subtitle;
  final VoidCallback onTap;
  final bool implyNavigation;
  final bool borders;
  final List<CellAction> actions;
  final EufemiaSpacing contentPadding;

  const Cell({
    Key key,
    this.leading,
    this.title,
    this.trailing,
    this.subtitle,
    this.onTap,
    this.borders = true,
    this.implyNavigation = false,
    this.actions,
    this.contentPadding,
  }) : super(key: key);

  factory Cell.shimmer({bool leading = false, bool trailing = false}) {
    return Cell(
      leading: leading ? Shimmer.circular(24.0) : null,
      title: Shimmer(),
      trailing: trailing ? Shimmer(width: 48.0) : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final typography = EufemiaTypography.of(context);
    final palette = EufemiaPalette.of(context);

    final cell = GestureDetector(
      onTap: onTap,
      child: EufemiaPadding.only(
        context.cupertino ? EufemiaSpace.medium : EufemiaSpace.none,
        sides: EufemiaSides.left,
        child: Container(
          decoration: cellDecoration(palette),
          child: SafeArea(
            bottom: false,
            top: false,
            child: EufemiaRow(
              padding: EufemiaInsets.allMedium,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: EufemiaColumn(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EufemiaRow(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (hasLeading) ...{
                            AnimatedDefaultTextStyle(
                              duration: Duration(milliseconds: 160),
                              style: typography.styles.titleDemi.toTextStyle(
                                context,
                              ),
                              child: leading,
                            ),
                          },
                          Flexible(
                            child: EufemiaPadding.only(
                              hasLeading
                                  ? EufemiaSpace.medium
                                  : EufemiaSpace.none,
                              sides: EufemiaSides.left,
                              child: AnimatedDefaultTextStyle(
                                duration: Duration(milliseconds: 160),
                                style: typography.styles.body.toTextStyle(
                                  context,
                                ),
                                child: EufemiaColumn(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    title,
                                    if (hasSubtitle) ...{
                                      AnimatedDefaultTextStyle(
                                        duration: Duration(milliseconds: 160),
                                        style: typography.styles.subhead
                                            .toTextStyle(
                                          context,
                                        ),
                                        child: subtitle,
                                      ),
                                    }
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (hasTrailing) ...{
                  EufemiaRow(
                    children: [
                      AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 160),
                        style: typography.styles.body.toTextStyle(context),
                        child: trailing,
                      ),
                      if (trailingIsText) ...{
                        EufemiaPadding.small(),
                      },
                      if (implyNavigation) ...{
                        Icon(
                          EufemiaIcons.chevron,
                          size: 12.0,
                          color: palette.grey,
                        ),
                      }
                    ],
                  ),
                } else if (implyNavigation) ...{
                  Icon(
                    EufemiaIcons.chevron,
                    size: 12.0,
                    color: palette.light,
                  ),
                }
              ],
            ),
          ),
        ),
      ),
    );

    return Slidable(
      key: UniqueKey(),
      actionPane: SlidableDrawerActionPane(),
      dismissal: SlidableDismissal(
        child: SlidableDrawerDismissal(),
      ),
      child: cell,
      actions: slideActions,
    );
  }

  BoxDecoration cellDecoration(EufemiaPaletteData palette) {
    if (borders) {
      return BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: palette.outline,
          ),
        ),
      );
    }
    return null;
  }

  bool get hasLeading => leading != null;
  bool get hasSubtitle => subtitle != null;
  bool get hasTrailing => trailing != null;
  bool get trailingIsText =>
      trailing is Text ||
      trailing is DefaultTextStyle ||
      trailing is AnimatedDefaultTextStyle;

  List<IconSlideAction> get slideActions => actions
      ?.map(
        (action) => IconSlideAction(
          caption: action.label,
          color: action.color,
          iconWidget: action.icon,
          onTap: action.onTap,
        ),
      )
      ?.toList();
}

class CellAction {
  final String label;
  final Color color;
  final Widget icon;
  final VoidCallback onTap;

  CellAction({
    @required this.label,
    @required this.color,
    @required this.icon,
    @required this.onTap,
  });
}
