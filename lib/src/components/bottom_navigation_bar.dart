import 'package:eufemia/src/style/colors.dart';
import 'package:flutter/material.dart';

const double _kBorderWidth = 0.5;
const double _kItemVerticalPadding = 10.75;
const double _kItemHorizontalPadding = 16.75;
final Color _kBorderColor = EufemiaColors.softGray;

class BottomNavigationBar extends StatelessWidget {
  final List<Widget> items;

  const BottomNavigationBar({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: _kBorderWidth,
            color: _kBorderColor,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: _kItemHorizontalPadding,
          vertical: _kItemVerticalPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items,
        ),
      ),
    );
  }
}
