import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;

final Color _trackColor = EufemiaColors.seaGreenAlt;
final Color _activeTrackColor = EufemiaColors.seaGreenAlt.withOpacity(0.5);
final Color _inactiveTrackColor = EufemiaColors.coal.withOpacity(0.2);
final Color _inactiveThumbColor = EufemiaColors.outlineGray;

/// Switch from the Eufemia Design System
class Switch extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;
  final bool shrink;

  /// Switch from the Eufemia Design System
  ///
  /// * [value]: The value of the switch
  /// * [onChanged]: Callback for when the value is changed
  const Switch({Key key, this.value, this.onChanged, this.shrink = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return material.Switch.adaptive(
      value: value,
      onChanged: onChanged,
      activeColor: _trackColor,
      activeTrackColor: _activeTrackColor,
      inactiveTrackColor: _inactiveTrackColor,
      inactiveThumbColor: _inactiveThumbColor,
      materialTapTargetSize: shrink ? MaterialTapTargetSize.shrinkWrap : null,
    );
  }
}
