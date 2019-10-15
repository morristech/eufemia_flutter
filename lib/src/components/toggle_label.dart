import 'package:eufemia/src/style/colors.dart';
import 'package:flutter/material.dart';

const double _kBorderRadius = 100.0;
const double _kBorderWidth = 1.5;
const int _kAnimationDuration = 250;

final Color _kSelectedColor = EufemiaColors.emeraldGreen;
final Color _kUnselectedColor = Colors.white;
final Color _kBorderColor = EufemiaColors.emeraldGreen;
final Color _kSelectedFontColor = EufemiaColors.mintGreen;
final Color _kUnselectedFontColor = EufemiaColors.emeraldGreen;

class ToggleLabel extends StatelessWidget {
  final bool selected;
  final String label;
  final Function(bool) onChange;

  const ToggleLabel({
    Key key,
    this.selected,
    this.label,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
        duration: Duration(milliseconds: _kAnimationDuration),
        decoration: BoxDecoration(
          color: selected ? _kSelectedColor : _kUnselectedColor,
          border: Border.all(
            color: _kBorderColor,
            width: _kBorderWidth,
          ),
          borderRadius: BorderRadius.circular(_kBorderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            label,
            style: TextStyle(
              color: selected ? _kSelectedFontColor : _kUnselectedFontColor,
            ),
          ),
        ),
      ),
      onTap: () {
        if (onChange != null) {
          onChange(!selected);
        }
      },
    );
  }
}
