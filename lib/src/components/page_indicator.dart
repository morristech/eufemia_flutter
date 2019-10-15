import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _kBorderWidth = 1.0;
const int _kAnimationDuration = 250;
final Color _kColor = EufemiaColors.seaGreenAlt;
final Color _kUnselectedColor = Colors.transparent;

class PageIndicator extends StatelessWidget {
  final bool selected;

  const PageIndicator({Key key, this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: _kAnimationDuration),
      decoration: BoxDecoration(
        color: _kColor,
        shape: BoxShape.circle,
        border: Border.all(
          width: _kBorderWidth,
          color: selected ? _kColor : _kUnselectedColor,
        ),
      ),
      width: 8,
      height: 8,
    );
  }
}
