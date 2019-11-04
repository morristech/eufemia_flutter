import 'package:eufemia/src/style/colors.dart';
import 'package:flutter/material.dart';

const double _borderWidth = 0.5;
const double _itemVerticalPadding = 10.75;
const double _itemHorizontalPadding = 16.75;
final Color _borderColor = EufemiaColors.softGray;

class BottomNavBar extends StatelessWidget {
  final List<Widget> items;

  const BottomNavBar({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: _borderWidth,
            color: _borderColor,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: _itemHorizontalPadding,
          vertical: _itemVerticalPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items,
        ),
      ),
    );
  }
}
