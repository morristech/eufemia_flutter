import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _kFontSize = 13.0;
const double _kBorderRadius = 100.0;
const double _kIconSize = 16.0;
const double _kLabelPadding = 4.0;
const int _kAnimationDuration = 250;
final Color _kIconColor = EufemiaColors.darkGray;
final Color _kColor = EufemiaColors.outlineGray;
final Color _kFontColor = EufemiaColors.coal;

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
          duration: Duration(milliseconds: _kAnimationDuration),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_kBorderRadius),
            color: _kColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.cancel,
                    color: _kIconColor,
                    size: _kIconSize,
                  ),
                  onTap: onDelete,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: _kLabelPadding),
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: _kFontSize,
                      color: _kFontColor,
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