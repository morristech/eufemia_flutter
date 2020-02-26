import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;

final Color _inactiveColor = EufemiaColors.softGray;

/// Range slider from the Eufemia Design System
class RangeSlider extends StatelessWidget {
  final RangeValues values;
  final Function(RangeValues) onChanged;
  final Function(RangeValues) onChangeStart;
  final Function(RangeValues) onChangeEnd;
  final Widget Function(BuildContext, RangeValues) labelBuilder;

  /// Range slider from the Eufemia Design System
  ///
  /// * [values]: The given [RangeValues] values
  /// * [onChanged]: Callback for when the values change
  /// * [onChangeStart]: Callback for when change starts
  /// * [onChangeEnd]: Callback for when change ends
  /// * [labelBuilder]: Optional builder for labels to display above the slider
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
          activeColor: context.bright
              ? EufemiaColors.seaGreenAlt
              : EufemiaColors.mintGreen,
          inactiveColor: _inactiveColor,
        ),
      ],
    );
  }
}
