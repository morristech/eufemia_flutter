import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _kBorderWidth = 0.5;
const double _kHorizontalPadding = 16.0;
const double _kTopPadding = 32.0;
final Color _kBorderColor = EufemiaColors.softGray;

class ScrollableList extends StatelessWidget {
  final List<Widget> children;
  final bool shrinkWrap;
  final bool topPadding;
  final bool horizontalPadding;
  final bool showBorders;
  final EdgeInsets customPadding;
  const ScrollableList({
    Key key,
    this.children,
    this.shrinkWrap = false,
    this.topPadding = false,
    this.horizontalPadding = false,
    this.customPadding,
    this.showBorders = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: shrinkWrap,
        padding: customPadding ??
            EdgeInsets.only(
              left: horizontalPadding ? _kHorizontalPadding : 0.0,
              right: horizontalPadding ? _kHorizontalPadding : 0.0,
              top: topPadding ? _kTopPadding : 0.0,
            ),
        children: [
          if (showBorders) ...{
            Container(
              padding: EdgeInsets.only(top: topPadding ? 16.0 : 0.0, bottom: 16.0),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: _kBorderWidth,
                    color: _kBorderColor,
                  ),
                  bottom: BorderSide(
                    width: _kBorderWidth,
                    color: _kBorderColor,
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
