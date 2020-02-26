import 'package:eufemia/src/components/custom/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eufemia/eufemia.dart';

class SegmentedControl<T> extends StatelessWidget {
  final Map<T, Widget> children;
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
    return CustomSlidingSegmentedControl(
      children: addPadding(children),
      onValueChanged: onValueChanged,
      groupValue: groupValue,
      padding: const EdgeInsets.all(2.0),
      backgroundColor:
          context.bright ? EufemiaColors.outlineGray : EufemiaColors.gray4,
      thumbColor: context.bright ? Colors.white : EufemiaColors.gray6,
      thumbRadius: context.cupertino ? 6.93 : 100.0,
      trackRadius: context.cupertino ? 8.0 : 100.0,
    );
  }

  addPadding(Map<T, Widget> map) {
    return map.map((key, value) => MapEntry(
          key,
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 6.0,
              horizontal: 8.0,
            ),
            child: value,
          ),
        ));
  }
}
