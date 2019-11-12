import 'package:eufemia/eufemia.dart';
import 'package:eufemia/src/style/colors.dart';
import 'package:flutter/material.dart';

const double _borderRadius = 2.0;
final Color _fontColor = Colors.white;
final Color _backgroundColor = EufemiaColors.coal;
final Color _actionLabelColor = EufemiaColors.mintGreen;

class Snacks {
  static SnackBar buildSnackBar({
    String label,
    String actionLabel,
    VoidCallback onActionPressed,
    bool showProgressIndicator = false,
    bool persist = false,
  }) {
    return SnackBar(
      duration: persist ? Duration(days: 365) : Duration(seconds: 4),
      backgroundColor: _backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      content: Row(
        children: [
          if (showProgressIndicator) ...{
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Spinner(),
            ),
          },
          if (label != null) ...{
            Text(
              label,
              style: TextStyle(color: _fontColor),
            ),
          },
        ],
      ),
      action: actionLabel != null && onActionPressed != null
          ? SnackBarAction(
              label: actionLabel,
              textColor: _actionLabelColor,
              onPressed: onActionPressed,
            )
          : null,
    );
  }
}
