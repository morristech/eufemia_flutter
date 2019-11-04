import 'package:eufemia/src/style/colors.dart';
import 'package:flutter/material.dart';

const double _borderRadius = 100.0;
const double _borderWidth = 1.5;
const int _animationDuration = 250;

final Color _selectedColor = EufemiaColors.emeraldGreen;
final Color _UnselectedColor = Colors.white;
final Color _borderColor = EufemiaColors.emeraldGreen;
final Color _selectedFontColor = EufemiaColors.mintGreen;
final Color _UnselectedFontColor = EufemiaColors.emeraldGreen;

/// Toggle label from the Eufemia Design System
class ToggleLabel extends StatelessWidget {
  final bool selected;
  final String label;
  final Function(bool) onChange;

  /// Toggle label from the Eufemia Design System
  ///
  /// * [selected]: If the label is toggled or not
  /// * [label]: The label
  /// * [onChange]: Callback for when the the label is pressed
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
        duration: Duration(milliseconds: _animationDuration),
        decoration: BoxDecoration(
          color: selected ? _selectedColor : _UnselectedColor,
          border: Border.all(
            color: _borderColor,
            width: _borderWidth,
          ),
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            label,
            style: TextStyle(
              color: selected ? _selectedFontColor : _UnselectedFontColor,
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
