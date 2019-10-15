import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;

final Color _kTrackColor = EufemiaColors.seaGreenAlt;
final Color _kActiveTrackColor = EufemiaColors.seaGreenAlt.withOpacity(0.5);
final Color _kInactiveTrackColor = EufemiaColors.coal.withOpacity(0.2);
final Color _kInactiveThumbColor = EufemiaColors.outlineGray;

/// Switch from the Eufemia Design System
class Switch extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;

  /// Switch from the Eufemia Design System
  ///
  /// * [value]: The value of the switch
  /// * [onChanged]: Callback for when the value is changed
  const Switch({Key key, this.value, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return material.Switch.adaptive(
      value: value,
      onChanged: onChanged,
      activeColor: _kTrackColor,
      activeTrackColor: _kActiveTrackColor,
      inactiveTrackColor: _kInactiveTrackColor,
      inactiveThumbColor: _kInactiveThumbColor,
    );
  }
}
