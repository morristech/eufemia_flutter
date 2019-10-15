import 'package:eufemia/src/style/colors.dart';
import 'package:flutter/material.dart';

const double _kBorderRadius = 2.0;
final Color _kFontColor = Colors.white;
final Color _kBackgroundColor = EufemiaColors.coal;
final Color _kActionLabelColor = EufemiaColors.mintGreen;

class Snacks {
  static SnackBar buildSnackBar({
    String label,
    String actionLabel,
    VoidCallback onActionPressed,
    bool showProgressIndicator = false,
  }) {
    return SnackBar(
      backgroundColor: _kBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_kBorderRadius),
      ),
      content: Row(
        children: [
          if (showProgressIndicator) ...{
            CircularProgressIndicator(),
          },
          if (label != null) ...{
            Text(
              label,
              style: TextStyle(color: _kFontColor),
            ),
          },
        ],
      ),
      action: actionLabel != null && onActionPressed != null
          ? SnackBarAction(
              label: actionLabel,
              textColor: _kActionLabelColor,
              onPressed: onActionPressed,
            )
          : null,
    );
  }
}
