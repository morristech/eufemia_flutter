import 'package:eufemia/components.dart';
import 'package:eufemia/palette.dart';
import 'package:eufemia/spacing.dart';
import 'package:eufemia/typography.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

/// {@category Components}
/// {@subCategory List}
/// A list cell from the Eufemia design system.
class Cell extends StatelessWidget {
  /// A widget on the left-hand side of this [Cell]'s title.
  final Widget leading;

  /// The "main" widget to display in this [Cell]. Should be the relevant
  /// information this cell is supposed to convey.
  final Widget title;

  /// A trailing widget on the right-hand side of this [Cell]'s title.
  final Widget trailing;

  /// A subtitle for this [Cell] that is display beneath the [title].
  final Widget subtitle;

  /// {@macro eufemia.gestures.onTap}
  final VoidCallback onTap;

  /// If this [Cell] should display an arrow implying navigation on tap.
  final bool implyNavigation;

  /// If this [Cell] should have borders around it.
  final bool borders;

  /// A list of actions that will be visible on certain platform-specific
  /// gestures, e.g. swipe in iOS or long-press on Android.
  final List<CellAction> actions;

  /// Padding to wrap the [Cell]'s contents in.
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

  /// Creates a [Cell] with its contents being shimmer skeleton loaders.
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

/// {@category Components}
/// {@subCategory List}
/// An action to display as a result of platform gestures on a [Cell].
class CellAction {
  /// The label text to display for the action.
  final String label;

  /// The background color for this action (iOS).
  final Color color;

  /// The icon to display for this action.
  final Widget icon;

  /// {@macro eufemia.gestures.onTap}
  final VoidCallback onTap;

  CellAction({
    @required this.label,
    @required this.color,
    @required this.icon,
    @required this.onTap,
  });
}
