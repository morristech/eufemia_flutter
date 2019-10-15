import 'package:eufemia/src/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;

final Color _kActiveColor = EufemiaColors.seaGreenAlt;
final Color _kInactiveColor = EufemiaColors.softGray;

class Slider extends StatelessWidget {
  final double value;
  final Function(double) onChanged;
  final Function(double) onChangeStart;
  final Function(double) onChangeEnd;

  const Slider({
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
      activeColor: _kActiveColor,
      inactiveColor: _kInactiveColor,
    );
  }
}
