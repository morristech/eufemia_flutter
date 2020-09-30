import 'package:eufemia/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// {@category Components}
/// {@subCategory Controls}
/// Adaptive slider from the Eufemia Design System
class EufemiaSlider extends StatelessWidget {
  /// {@macro eufemia.components.controls.value}
  final double value;

  /// The amount of divisions to split the slider into.
  final int divisions;

  /// {@macro eufemia.gestures.onChanged}
  final Function(double) onChanged;

  /// {@template eufemia.gestures.onChangeStart}
  /// The callback function that is called whenever a change starts. Passes the
  /// value from when the change started.
  /// {@endtemplate}
  final Function(double) onChangeStart;

  /// {@template eufemia.gestures.onChangeEnd}
  /// The callback function that is called whenever a change ends. Passes the
  /// value from when the change ended.
  /// {@endtemplate}
  final Function(double) onChangeEnd;

  /// Adaptive slider from the Eufemia Design System
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
