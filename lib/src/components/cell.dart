import 'dart:io';

import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

const double _borderWidth = 0.5;
const double _contentPadding = 16.0;
final Color _borderColor = EufemiaColors.outlineGray;
final Color _iconColor = EufemiaColors.softGray;
final Color _leadingIconColor = EufemiaColors.seaGreenAlt;
final Duration _styleChangeDuration = Duration(milliseconds: 500);

class Cell extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget trailing;
  final Widget subtitle;
  final VoidCallback onTap;
  final bool implyNavigation;
  final List<CellAction> actions;

  const Cell({
    Key key,
    this.leading,
    this.title,
    this.trailing,
    this.subtitle,
    this.onTap,
    this.implyNavigation = false,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
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
    final _subtitleTextStyle = Theme.of(context).textTheme.subtitle;
    final _titleTextStyle = Theme.of(context).textTheme.subhead;
    final _trailingTextStyle = Theme.of(context).textTheme.subhead.copyWith(
          fontWeight: FontWeight.bold,
        );
    final _leadingTextStyle = _trailingTextStyle.copyWith(
      fontSize: 20.0,
    );
    return GestureDetector(
      onTap: onTap,
      onLongPress: Platform.isIOS ? null : _handleLongPress,
      child: Padding(
        padding: Platform.isIOS ? const EdgeInsets.only(left: _contentPadding) : EdgeInsets.zero,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: _borderWidth,
                color: _borderColor,
              ),
            ),
          ),
          child: Padding(
            padding: Platform.isIOS
                ? EdgeInsets.only(
                    top: _contentPadding,
                    right: _contentPadding,
                    bottom: _contentPadding,
                  )
                : const EdgeInsets.all(_contentPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (leading != null) ...{
                      AnimatedDefaultTextStyle(
                        duration: _styleChangeDuration,
                        style: _leadingTextStyle,
                        overflow: TextOverflow.fade,
                        child: IconTheme(
                          data: IconThemeData(
                            color: _leadingIconColor,
                          ),
                          child: leading,
                        ),
                      ),
                    },
                    if (title != null) ...{
                      Padding(
                        padding: EdgeInsets.only(
                          left: leading != null ? _contentPadding : 0.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedDefaultTextStyle(
                              style: _titleTextStyle,
                              overflow: TextOverflow.fade,
                              duration: _styleChangeDuration,
                              child: title,
                            ),
                            if (subtitle != null) ...{
                              AnimatedDefaultTextStyle(
                                style: _subtitleTextStyle,
                                overflow: TextOverflow.fade,
                                duration: _styleChangeDuration,
                                child: subtitle,
                              ),
                            },
                          ],
                        ),
                      )
                    },
                  ],
                ),
                if (trailing != null) ...{
                  AnimatedDefaultTextStyle(
                    duration: _styleChangeDuration,
                    style: _trailingTextStyle,
                    overflow: TextOverflow.fade,
                    child: IconTheme(
                      data: IconThemeData(color: _iconColor),
                      child: trailing,
                    ),
                  )
                } else if (implyNavigation) ...{
                  AnimatedDefaultTextStyle(
                    duration: _styleChangeDuration,
                    style: _trailingTextStyle,
                    overflow: TextOverflow.fade,
                    child: IconTheme(
                      data: IconThemeData(color: _iconColor),
                      child: Icon(Icons.chevron_right),
                    ),
                  ),
                },
              ],
            ),
          ),
        ),
      ),
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
