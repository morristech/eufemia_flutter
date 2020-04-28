import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;

final Color _inactiveThumbColor = EufemiaColors.outlineGray;

/// Switch from the Eufemia Design System
class EufemiaSwitch extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;
  final bool shrink;

  /// Switch from the Eufemia Design System
  ///
  /// * [value]: The value of the switch
  /// * [onChanged]: Callback for when the value is changed
  const EufemiaSwitch(
      {Key key, this.value, this.onChanged, this.shrink = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);
    return material.Switch.adaptive(
      value: value,
      onChanged: onChanged,
      activeColor: palette.secondary,
      activeTrackColor: palette.secondary.withOpacity(0.5),
      inactiveTrackColor: palette.grey.withOpacity(0.3),
      inactiveThumbColor: _inactiveThumbColor,
      materialTapTargetSize: shrink ? MaterialTapTargetSize.shrinkWrap : null,
    );
  }
}
