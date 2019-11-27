import 'package:eufemia/src/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;

final Color _activeColor = EufemiaColors.seaGreenAlt;
final Color _inactiveColor = EufemiaColors.softGray;

/// Slider from the Eufemia Design System
class EufemiaSlider extends StatelessWidget {
  final double value;
  final Function(double) onChanged;
  final Function(double) onChangeStart;
  final Function(double) onChangeEnd;

  /// Slider from the Eufemia Design System
  ///
  /// * [value]: The current value of the slider
  /// * [onChanged]: Callback for when the value changes
  /// * [onChangeStart]: Callback for when a change starts
  /// * [onChangeEnd]: Callback for when a change ends
  const EufemiaSlider({
    Key key,
    @required this.value,
    @required this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return material.Slider.adaptive(
      value: value,
      onChanged: onChanged,
      onChangeStart: onChangeStart,
      onChangeEnd: onChangeEnd,
      activeColor: _activeColor,
      inactiveColor: _inactiveColor,
    );
  }
}
