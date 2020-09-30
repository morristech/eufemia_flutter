import 'package:eufemia/spacing.dart';
import 'package:flutter/material.dart';

// Exports some convenience extensions
export 'package:snack/snack.dart';

/// {@category Components}
/// Wrapper around [SnackBar] helper methods.
class Snacks {
  /// Returns a [SnackBar] from the given parameters.
  static SnackBar bar({
    @required Widget title,
    Widget leading,
    String actionLabel,
    VoidCallback onTap,
    Duration duration,
  }) {
    SnackBarAction action;

    if (actionLabel != null) {
      action = SnackBarAction(
        label: actionLabel,
        onPressed: onTap,
      );
    }

    return SnackBar(
      elevation: 1,
      content: EufemiaRow(
        children: [
          if (leading != null) ...{
            EufemiaPadding.medium(
              sides: EufemiaSides.right,
              child: leading,
            ),
          },
          title,
        ],
      ),
      action: action,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
      behavior: SnackBarBehavior.floating,
      duration: duration ?? Duration(seconds: 4),
    );
  }
}
