import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _kBorderWidth = 1.0;
const int _kAnimationDuration = 250;
final Color _kColor = EufemiaColors.seaGreenAlt;
final Color _kUnselectedColor = Colors.transparent;

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
      duration: Duration(milliseconds: _kAnimationDuration),
      decoration: BoxDecoration(
        color: selected ? _kColor : _kUnselectedColor,
        shape: BoxShape.circle,
        border: Border.all(width: _kBorderWidth, color: _kColor),
      ),
      width: 8,
      height: 8,
    );
  }
}
