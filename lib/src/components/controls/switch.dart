import 'package:eufemia/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// {@category Components}
/// {@subCategory Controls}
/// Switch from the Eufemia design system.
class EufemiaSwitch extends StatelessWidget {
  /// {@macro eufemia.components.controls.value}
  final bool value;

  /// {@macro eufemia.gestures.onChanged}
  final Function(bool) onChanged;

  /// If true, the switch removes all extra padding
  final bool shrink;

  const EufemiaSwitch({
    Key key,
    this.value,
    this.onChanged,
    this.shrink = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);
    return Switch.adaptive(
      value: value,
      onChanged: onChanged,
      activeColor: palette.toggle,
      activeTrackColor: palette.toggle.withOpacity(0.5),
      inactiveTrackColor: palette.grey.withOpacity(0.3),
      inactiveThumbColor: palette.outline,
      materialTapTargetSize: shrink ? MaterialTapTargetSize.shrinkWrap : null,
    );
  }
}
