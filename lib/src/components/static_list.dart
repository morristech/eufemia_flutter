import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _borderWidth = 0.5;
const double _horizontalPadding = 16.0;
const double _topPadding = 32.0;
final Color _borderColor = EufemiaColors.softGray;

class StaticList extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool topPadding;
  final bool bottomPadding;
  final bool horizontalPadding;
  final bool showBorders;
  final bool addBottomBorder;
  final EdgeInsets customPadding;
  final Color backgroundColor;

  const StaticList({
    Key key,
    this.children,
    this.topPadding = false,
    this.bottomPadding = false,
    this.horizontalPadding = false,
    this.customPadding,
    this.showBorders = true,
    this.backgroundColor,
    this.addBottomBorder = true,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (showBorders) {
      if (children.last is Cell) {
        children.last = (children.last as Cell).copyWithListOrder(lastInList: true);
      } else if (addBottomBorder) {
        children.last = Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: _borderColor,
                width: _borderWidth,
              ),
            ),
          ),
          child: children.last,
        );
      }
    }
    return Container(
      padding: customPadding ??
          EdgeInsets.only(
            left: horizontalPadding ? _horizontalPadding : 0.0,
            right: horizontalPadding ? _horizontalPadding : 0.0,
            top: topPadding ? _topPadding : 0.0,
          ),
      child: Column(
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
                    style: Theme.of(context).textTheme.subhead.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
          },
          if (showBorders) ...{
            Container(
              margin: EdgeInsets.only(
                top: topPadding ? 16.0 : 0.0,
                bottom: bottomPadding ? 16.0 : 0.0,
              ),
              decoration: BoxDecoration(
                color: backgroundColor ?? Theme.of(context).cardColor,
                border: Border(
                  top: BorderSide(
                    width: _borderWidth,
                    color: _borderColor,
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: children,
              ),
            )
          } else ...{
            Container(
              color: backgroundColor ?? Theme.of(context).cardColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: children,
              ),
            ),
          },
        ],
      ),
    );
  }
}
