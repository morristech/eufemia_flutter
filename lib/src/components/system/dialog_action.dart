import 'package:flutter/material.dart';

class DialogAction {
  final String label;
  final VoidCallback onPressed;
  final bool isDefaultAction;
  final bool isDestructiveAction;
  final bool enabled;

  DialogAction({
    this.label,
    this.onPressed,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
    this.enabled = true,
  });
}
