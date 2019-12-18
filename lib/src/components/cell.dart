import 'package:eufemia/eufemia.dart';
import 'package:eufemia/src/components/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

const double _borderWidth = 0.5;
const double _contentPadding = 16.0;
final Color _borderColor = EufemiaColors.outlineGray;
final Color _borderEndColor = EufemiaColors.softGray;
final Color _iconColor = EufemiaColors.softGray;
final Duration _styleChangeDuration = Duration(milliseconds: 500);

class Cell extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget trailing;
  final Widget subtitle;
  final VoidCallback onTap;
  final bool implyNavigation;
  final bool isLastInList;
  final bool showBottomBorder;
  final bool centerLeading;
  final List<CellAction> actions;
  final EdgeInsets contentPadding;

  const Cell({
    Key key,
    this.leading,
    this.title,
    this.trailing,
    this.subtitle,
    this.onTap,
    this.implyNavigation = false,
    this.actions,
    this.isLastInList = false,
    this.contentPadding,
    this.showBottomBorder = true,
    this.centerLeading = true,
  }) : super(key: key);

  factory Cell.shimmer() {
    return Cell(
      title: Shimmer(),
    );
  }

  static List<Cell> shimmerList({int count = 1}) {
    return List.generate(count, (i) => i + 1)
        .map((i) => Cell.shimmer())
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return Slidable(
        actionPane: SlidableDrawerActionPane(),
        child: _buildCell(context),
        actions: actions != null
            ? actions.map(
                (action) {
                  return IconSlideAction(
                    caption: action.label,
                    color: action.color,
                    iconWidget: action.icon,
                    onTap: action.onTap,
                  );
                },
              ).toList()
            : null,
      );
    } else {
      return Slidable(
        key: UniqueKey(),
        actionPane: SlidableDrawerDismissal(),
        dismissal: SlidableDismissal(
          child: SlidableDrawerDismissal(),
        ),
        child: _buildCell(context),
        actions: actions != null
            ? actions.map(
                (action) {
                  return IconSlideAction(
                    caption: action.label,
                    color: action.color,
                    iconWidget: action.icon,
                    onTap: action.onTap,
                  );
                },
              ).toList()
            : null,
      );
    }
  }

  void _handleLongPress() {}

  Widget _buildCell(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: Theme.of(context).platform == TargetPlatform.iOS
          ? null
          : _handleLongPress,
      child: Padding(
        padding:
            (Theme.of(context).platform == TargetPlatform.iOS && !isLastInList)
                ? const EdgeInsets.only(left: _contentPadding)
                : EdgeInsets.zero,
        child: Container(
          decoration: BoxDecoration(
            border: showBottomBorder
                ? Border(
                    bottom: BorderSide(
                      width: _borderWidth,
                      color: isLastInList ? _borderEndColor : _borderColor,
                    ),
                  )
                : null,
          ),
          child: Padding(
            padding: contentPadding ??
                (Theme.of(context).platform == TargetPlatform.iOS
                    ? EdgeInsets.only(
                        left:
                            Theme.of(context).platform == TargetPlatform.iOS &&
                                    isLastInList
                                ? _contentPadding
                                : 0.0,
                        top: _contentPadding,
                        right: _contentPadding,
                        bottom: _contentPadding,
                      )
                    : const EdgeInsets.all(_contentPadding)),
            child: SafeArea(
              bottom: false,
              top: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: centerLeading
                              ? CrossAxisAlignment.center
                              : CrossAxisAlignment.start,
                          children: [
                            if (leading != null) ...{
                              AnimatedDefaultTextStyle(
                                duration: _styleChangeDuration,
                                style: Theme.of(context)
                                    .textTheme
                                    .title
                                    .copyWith(fontWeight: FontWeight.bold),
                                overflow: TextOverflow.fade,
                                child: leading,
                              ),
                            },
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: leading != null ? 16.0 : 0.0),
                                child: AnimatedDefaultTextStyle(
                                  style: Theme.of(context).textTheme.body1,
                                  overflow: TextOverflow.fade,
                                  duration: _styleChangeDuration,
                                  child: title,
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (subtitle != null) ...{
                          Padding(
                            padding: EdgeInsets.only(
                              left: leading != null
                                  ? 16.0 + Theme.of(context).iconTheme.size
                                  : 0.0,
                            ),
                            child: AnimatedDefaultTextStyle(
                              style:
                                  Theme.of(context).textTheme.subhead.copyWith(
                                        color: EufemiaColors.darkGray,
                                      ),
                              overflow: TextOverflow.fade,
                              duration: _styleChangeDuration,
                              child: subtitle,
                            ),
                          )
                        },
                      ],
                    ),
                  ),
                  if (trailing != null) ...{
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedDefaultTextStyle(
                          duration: _styleChangeDuration,
                          style: Theme.of(context).textTheme.body1.copyWith(
                                color: EufemiaColors.darkGray,
                              ),
                          overflow: TextOverflow.fade,
                          child: IconTheme(
                            data: IconThemeData(color: _iconColor),
                            child: trailing,
                          ),
                        ),
                        if (trailing is Text ||
                            trailing is AnimatedDefaultTextStyle) ...{
                          SizedBox(width: 8.0),
                        },
                        if (implyNavigation) ...{
                          _buildNavigationButton(context),
                        }
                      ],
                    ),
                  } else if (implyNavigation) ...{
                    _buildNavigationButton(context),
                  },
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButton(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: _styleChangeDuration,
      style: Theme.of(context).textTheme.body2,
      overflow: TextOverflow.fade,
      child: IconTheme(
        data: IconThemeData(color: _iconColor),
        child: Icon(
          EufemiaIcons.chevron,
          size: 12,
        ),
      ),
    );
  }

  Cell copyWithListOrder({bool lastInList}) {
    return Cell(
      leading: this.leading,
      title: this.title,
      trailing: this.trailing,
      subtitle: this.subtitle,
      onTap: this.onTap,
      implyNavigation: this.implyNavigation,
      isLastInList: lastInList ?? this.isLastInList,
      contentPadding: this.contentPadding,
    );
  }
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
