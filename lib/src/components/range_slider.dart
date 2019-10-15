import 'package:eufemia/src/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;

final Color _kActiveColor = EufemiaColors.seaGreenAlt;
final Color _kInactiveColor = EufemiaColors.softGray;

class RangeSlider extends StatelessWidget {
  final RangeValues values;
  final Function(RangeValues) onChanged;
  final Function(RangeValues) onChangeStart;
  final Function(RangeValues) onChangeEnd;
  final Widget Function(BuildContext, RangeValues) labelBuilder;

  const RangeSlider({
    Key key,
    @required this.values,
    @required this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.labelBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelBuilder != null) ...{
          labelBuilder(context, values),
        },
        material.RangeSlider(
          values: values,
          onChanged: onChanged,
          onChangeStart: onChangeStart,
          onChangeEnd: onChangeEnd,
          activeColor: _kActiveColor,
          inactiveColor: _kInactiveColor,
        ),
      ],
    );
  }
}
