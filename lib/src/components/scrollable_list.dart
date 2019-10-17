import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _kBorderWidth = 0.5;
const double _kHorizontalPadding = 16.0;
const double _kTopPadding = 32.0;
final Color _kBorderColor = EufemiaColors.softGray;

class ScrollableList extends StatelessWidget {
  final List<Widget> children;
  final bool shrinkWrap;
  const ScrollableList({Key key, this.children, this.shrinkWrap = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: shrinkWrap,
        padding: const EdgeInsets.only(
          left: _kHorizontalPadding,
          right: _kHorizontalPadding,
          top: _kTopPadding,
        ),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
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
          ),
        ],
      ),
    );
  }
}
