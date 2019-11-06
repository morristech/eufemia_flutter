import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _borderWidth = 0.5;
const double _HorizontalPadding = 16.0;
const double _topPadding = 32.0;
final Color _borderColor = EufemiaColors.softGray;

class ScrollableList extends StatelessWidget {
  final List<Widget> children;
  final bool shrinkWrap;
  final bool topPadding;
  final bool horizontalPadding;
  final bool showBorders;
  final EdgeInsets customPadding;
  final ScrollPhysics physics;
  const ScrollableList({
    Key key,
    this.children,
    this.shrinkWrap = false,
    this.topPadding = false,
    this.horizontalPadding = false,
    this.customPadding,
    this.showBorders = true,
    this.physics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: physics,
        shrinkWrap: shrinkWrap,
        padding: customPadding ??
            EdgeInsets.only(
              left: horizontalPadding ? _HorizontalPadding : 0.0,
              right: horizontalPadding ? _HorizontalPadding : 0.0,
              top: topPadding ? _topPadding : 0.0,
            ),
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
                  bottom: BorderSide(
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
