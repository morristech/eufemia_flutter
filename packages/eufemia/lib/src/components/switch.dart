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
    return material.Switch.adaptive(
      value: value,
      onChanged: onChanged,
      activeColor:
          context.bright ? EufemiaColors.seaGreenAlt : EufemiaColors.mintGreen,
      activeTrackColor: context.bright
          ? EufemiaColors.seaGreenAlt.withOpacity(0.5)
          : EufemiaColors.mintGreen.withOpacity(0.5),
      inactiveTrackColor: context.bright
          ? EufemiaColors.coal.withOpacity(0.2)
          : EufemiaColors.subtleGray.withOpacity(0.5),
      inactiveThumbColor: _inactiveThumbColor,
      materialTapTargetSize: shrink ? MaterialTapTargetSize.shrinkWrap : null,
    );
  }
}
