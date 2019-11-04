import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _FontSize = 13.0;
const double _borderRadius = 100.0;
const double _iconSize = 16.0;
const double _labelPadding = 4.0;
const int _animationDuration = 250;
final Color _iconColor = EufemiaColors.darkGray;
final Color _color = EufemiaColors.outlineGray;
final Color _FontColor = EufemiaColors.coal;

/// Tag from the Eufemia Design System
class Tag extends StatelessWidget {
  final String label;
  final VoidCallback onDelete;

  /// Tag from the Eufemia Design System
  ///
  /// * [label]: The label of the tag
  /// * [onDelete]: Callback for when the delete button is pressed
  const Tag({Key key, this.label, this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: _animationDuration),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_borderRadius),
            color: _color,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.cancel,
                    color: _iconColor,
                    size: _iconSize,
                  ),
                  onTap: onDelete,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: _labelPadding),
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: _FontSize,
                      color: _FontColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
