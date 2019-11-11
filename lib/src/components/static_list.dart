import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _borderWidth = 0.5;
const double _horizontalPadding = 16.0;
const double _topPadding = 32.0;
final Color _borderColor = EufemiaColors.softGray;

class StaticList extends StatelessWidget {
  final List<Widget> children;
  final bool topPadding;
  final bool horizontalPadding;
  final bool showBorders;
  final EdgeInsets customPadding;
  final Color backgroundColor;

  const StaticList({
    Key key,
    this.children,
    this.topPadding = false,
    this.horizontalPadding = false,
    this.customPadding,
    this.showBorders = true,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (showBorders) {
      if (children.last is Cell) {
        children.last = (children.last as Cell).copyWithListOrder(lastInList: true);
      } else {
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
      color: backgroundColor,
      padding: customPadding ??
          EdgeInsets.only(
            left: horizontalPadding ? _horizontalPadding : 0.0,
            right: horizontalPadding ? _horizontalPadding : 0.0,
            top: topPadding ? _topPadding : 0.0,
          ),
      child: Column(
        children: [
          if (showBorders) ...{
            Container(
              padding: EdgeInsets.only(top: topPadding ? 16.0 : 0.0, bottom: 16.0),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: _borderWidth,
                    color: _borderColor,
                  ),
                ),
              ),
              child: Column(
                children: children,
              ),
            )
          } else ...{
            Column(
              children: children,
            )
          },
        ],
      ),
    );
  }
}
