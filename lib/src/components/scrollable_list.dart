import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _borderWidth = 0.5;
const double _horizontalPadding = 16.0;
const double _topPadding = 32.0;
final Color _borderColor = EufemiaColors.softGray;

class ScrollableList extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool shrinkWrap;
  final bool topPadding;
  final bool bottomPadding;
  final bool horizontalPadding;
  final bool showBorders;
  final bool addBottomBorder;
  final EdgeInsets customPadding;
  final ScrollPhysics physics;
  final ScrollController controller;

  const ScrollableList({
    Key key,
    this.children,
    this.shrinkWrap = false,
    this.topPadding = false,
    this.horizontalPadding = false,
    this.customPadding,
    this.showBorders = true,
    this.physics,
    this.bottomPadding = false,
    this.addBottomBorder = true,
    this.title,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (showBorders) {
      if (children.last is Cell) {
        children.last =
            (children.last as Cell).copyWithListOrder(lastInList: true);
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
      child: ListView(
        controller: controller,
        physics: physics,
        shrinkWrap: shrinkWrap,
        padding: customPadding ??
            EdgeInsets.only(
              left: horizontalPadding ? _horizontalPadding : 0.0,
              right: horizontalPadding ? _horizontalPadding : 0.0,
              top: topPadding ? _topPadding : 0.0,
            ),
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
            )
          },
          if (showBorders) ...{
            Container(
              margin: EdgeInsets.only(
                  top: topPadding ? 16.0 : 0.0,
                  bottom: bottomPadding ? 16.0 : 0.0),
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
