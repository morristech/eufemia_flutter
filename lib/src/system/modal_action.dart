import 'dart:ui';

import 'package:flutter/widgets.dart';

/// Helper class for actions to show
/// on a modal sheet
class ModalAction {
  /// The label/title of the action
  final String label;

  /// The callback function when the action is pressed
  final VoidCallback onPressed;

  /// If the action is a default action (iOS only)
  final bool isDefaultAction;

  /// If the action is destructive (iOS only)
  final bool isDestructive;

  /// If the action is active
  final bool enabled;

  final IconData icon;

  /// Constructs a [ModalAction] object
  ModalAction({
    this.label,
    this.onPressed,
    this.isDefaultAction = false,
    this.isDestructive = false,
    this.enabled = true,
    this.icon,
  });
}
