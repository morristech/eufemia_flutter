import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _borderWidth = 1.0;
const int _animationDuration = 250;
final Color _color = EufemiaColors.seaGreenAlt;
final Color _UnselectedColor = Colors.transparent;

/// Page indicator from the Eufemia Design System
class PageIndicator extends StatelessWidget {
  final bool selected;

  /// Page indicator from the Eufemia Design System
  ///
  /// * [selected]: Whether the indicator is selected or not
  const PageIndicator({Key key, @required this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: _animationDuration),
      decoration: BoxDecoration(
        color: selected ? _color : _UnselectedColor,
        shape: BoxShape.circle,
        border: Border.all(width: _borderWidth, color: _color),
      ),
      width: 8,
      height: 8,
    );
  }
}
