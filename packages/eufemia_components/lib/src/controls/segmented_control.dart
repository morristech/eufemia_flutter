import 'package:eufemia_components/src/controls/custom_sliding_segmented_control.dart';
import 'package:eufemia_components/src/utils/calculate_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eufemia/eufemia.dart';

class SegmentedControl<T> extends StatelessWidget {
  final Map<T, String> children;
  final ValueChanged<T> onValueChanged;
  final T groupValue;

  const SegmentedControl({
    Key key,
    this.onValueChanged,
    this.children,
    this.groupValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final typography = EufemiaTypography.of(context);
    final palette = EufemiaPalette.of(context);

    final style = typography.styles.footnoteEmphasized.toTextStyle(context);

    return DefaultTextStyle(
      style: style,
      child: CustomSlidingSegmentedControl(
        children: addPadding(context, children, style),
        onValueChanged: onValueChanged,
        groupValue: groupValue,
        padding: EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 3.0,
        ),
        backgroundColor: palette.outline,
        thumbColor: palette.card,
        thumbRadius: context.cupertino ? 6.93 : 100.0,
        trackRadius: context.cupertino ? 8.0 : 100.0,
        border: Border.all(
          width: context.cupertino ? 0.0 : 0.5,
          color: palette.light,
        ),
      ),
    );
  }

  Map<T, Widget> addPadding(
    BuildContext context,
    Map<T, String> map,
    TextStyle style,
  ) {
    return map.map(
      (key, value) {
        final size = calculateSize(value, style);

        return MapEntry(
          key,
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: context.cupertino ? 6 : 8.0,
              horizontal: 32.0 + (context.cupertino ? 8.0 : 16.0),
            ),
            child: Container(
              width: size.width,
              child: Text(value),
            ),
          ),
        );
      },
    );
  }
}
