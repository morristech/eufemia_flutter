import 'package:flutter/material.dart';

/// {@category Components}
/// {@subCategory System}
/// An action to use with system dialogs.
class DialogAction {
  /// {@macro eufemia.components.label}
  final String label;

  /// {@macro eufemia.gestures.onPressed}
  final VoidCallback onPressed;

  /// If this action should be the default chosen action.
  final bool isDefaultAction;

  /// If this action is destructive (will be displayed with visual hints).
  final bool isDestructiveAction;

  /// If this action is enlabled.
  final bool enabled;

  DialogAction({
    this.label,
    this.onPressed,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
    this.enabled = true,
  });
}
