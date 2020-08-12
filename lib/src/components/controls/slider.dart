import 'package:eufemia/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Slider from the Eufemia Design System
class EufemiaSlider extends StatelessWidget {
  final double value;
  final int divisions;
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
    this.divisions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);

    return Slider.adaptive(
      value: value,
      onChanged: onChanged,
      onChangeStart: onChangeStart,
      onChangeEnd: onChangeEnd,
      activeColor: palette.toggle,
      inactiveColor: palette.outline,
      divisions: divisions,
    );
  }
}
