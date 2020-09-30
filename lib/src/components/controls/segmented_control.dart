import 'dart:math' as math;

import 'package:eufemia/components.dart';
import 'package:eufemia/palette.dart';
import 'package:eufemia/src/components/utils/calculate_size.dart';
import 'package:eufemia/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/rendering.dart';

part 'custom_sliding_segmented_control.dart';

/// {@category Components}
/// {@subCategory Controls}
/// An adaptive segmented control from the Eufemia design system.
class SegmentedControl<T> extends StatelessWidget {
  /// The map of values and the according label to display in the control.
  /// [key]: value, e.g. the index
  /// [value]: the text to display, e.g. 'Tab 2'
  /// {@tools snippet}
  /// ```dart
  /// SegmentedControl<int>(
  ///   children: {
  ///     0: 'Label',
  ///     1: 'Label',
  ///     2: 'Label',
  ///   },
  ///   onChanged: (value) => setState(() => someStateValue = value),
  ///   groupValue: someStateValue,
  /// )
  /// ```
  /// {@end-tools}
  final Map<T, String> children;

  /// {@template eufemia.gestures.onValueChanged}
  /// Callback function that is called whenever the value of the control changes.
  /// The updated value is passed as a parameter.
  /// {@endtemplate}
  final ValueChanged<T> onChanged;

  /// {@template eufemia.components.controls.value}
  /// The current value of the component. Has to be updated on value changes
  /// to update the control itself, as the component is stateless.
  /// {@endtemplate}
  final T groupValue;

  const SegmentedControl({
    Key key,
    this.onChanged,
    this.children,
    this.groupValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final typography = EufemiaTypography.of(context);
    final palette = EufemiaPalette.of(context);

    final style = typography.styles.footnoteEmphasized.toTextStyle(context);

    return AnimatedDefaultTextStyle(
      duration: Duration(milliseconds: 160),
      style: style,
      child: _CustomSlidingSegmentedControl(
        children: addPadding(context, children, style),
        onValueChanged: onChanged,
        groupValue: groupValue,
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
              horizontal: context.cupertino ? 8 : 16,
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
