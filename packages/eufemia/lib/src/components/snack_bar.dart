import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

// Exports some convenience extensions
export 'package:snack/snack.dart';

const _borderRadius = 2.0;
const _snackDisplayDuration = Duration(milliseconds: 4000);
final _backgroundColor = EufemiaColors.coal;

class Snacks {
  static SnackBar bar({
    @required String title,
    Widget leading,
    String actionLabel,
    VoidCallback onPressed,
    Duration duration,
  }) {
    return SnackBar(
      content: Row(
        children: [
          if (leading != null) ...{
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: leading,
            ),
          },
          Text(title),
        ],
      ),
      action: actionLabel != null
          ? SnackBarAction(
              textColor: EufemiaColors.mintGreen,
              label: actionLabel,
              onPressed: onPressed,
            )
          : null,
      backgroundColor: _backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      behavior: SnackBarBehavior.floating,
      duration: duration ?? _snackDisplayDuration,
    );
  }
}
