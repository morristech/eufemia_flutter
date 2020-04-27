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
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.subtitle2.copyWith(
            color:
                context.bright ? EufemiaColors.coal : EufemiaColors.lightGray,
          ),
      child: CustomSlidingSegmentedControl(
        children: addPadding(context, children),
        onValueChanged: onValueChanged,
        groupValue: groupValue,
        padding: EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 3.0,
        ),
        backgroundColor:
            context.bright ? EufemiaColors.outlineGray : EufemiaColors.gray4,
        thumbColor: context.bright ? Colors.white : EufemiaColors.gray6,
        thumbRadius: context.cupertino ? 6.93 : 100.0,
        trackRadius: context.cupertino ? 8.0 : 100.0,
        border: context.cupertino
            ? null
            : Border.all(
                width: 0.5,
                color: context.bright
                    ? EufemiaColors.darkGray
                    : EufemiaColors.gray2,
              ),
      ),
    );
  }

  Map<T, Widget> addPadding(BuildContext context, Map<T, Widget> map) {
    return map.map(
      (key, value) => MapEntry(
        key,
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.cupertino ? 6 : 8.0,
            horizontal: 32.0 + (context.cupertino ? 8.0 : 16.0),
          ),
          child: value,
        ),
      ),
    );
  }
}
