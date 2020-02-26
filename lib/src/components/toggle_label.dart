import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _borderRadius = 100.0;
const double _borderWidth = 1.5;
const int _animationDuration = 250;

final Color _unselectedColor = Colors.white;

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
          color: selected
              ? context.theme.accentColor
              : context.bright ? _unselectedColor : Colors.transparent,
          border: Border.all(
            color: context.theme.accentColor,
            width: _borderWidth,
          ),
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            label,
            style: TextStyle(
              color: selected
                  ? context.theme.primaryColor
                  : context.theme.accentColor,
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
