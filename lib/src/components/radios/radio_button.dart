import 'package:eufemia/eufemia.dart';
import 'package:eufemia/src/components/radios/raw_radio.dart';
import 'package:eufemia/src/style/colors.dart';
import 'package:eufemia/src/style/constants.dart';
import 'package:flutter/material.dart';

class EufemiaRadio<T> extends StatelessWidget {
  final T groupValue;
  final T value;
  final Function(T) onChanged;
  final Color unselectedColor;
  final Color selectedColor;
  final Color errorColor;
  final Color backgroundColor;
  final String label;
  final Position labelPosition;
  final Status status;
  final Widget errorChip;
  final Widget infoChip;

  const EufemiaRadio({
    Key key,
    this.groupValue,
    this.value,
    this.onChanged,
    this.unselectedColor = EufemiaColors.seaGreen,
    this.selectedColor = EufemiaColors.seaGreen,
    this.errorColor = EufemiaColors.cherryRed,
    this.backgroundColor = EufemiaColors.white,
    this.label,
    this.labelPosition = Position.right,
    this.status = Status.none,
    this.errorChip,
    this.infoChip,
  }) : super(key: key);

  /// Getter for changing [enabled] status
  bool get enabled => _isWidgetEnabled(this);

  /// Returns [true] if the given [EufemiaRawButton] has a non-null [onPressed] callback, else returns [false]
  bool _isWidgetEnabled(EufemiaRadio widget) => widget.onChanged != null;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        disabledColor: unselectedColor,
        unselectedWidgetColor:
            status == Status.error ? errorColor : unselectedColor,
        fontFamily: 'FedraSansStd',
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (label != null && labelPosition == Position.left) ...{
                Text(label)
              },
              AnimatedOpacity(
                duration: EufemiaConstants.animationDuration,
                curve: Curves.ease,
                opacity: enabled ? 1.0 : 0.5,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: RawRadio(
                    groupValue: groupValue,
                    value: value,
                    onChanged: onChanged,
                    activeColor:
                        status == Status.error ? errorColor : selectedColor,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
              if (label != null && labelPosition == Position.right) ...{
                Text(label)
              },
            ],
          ),
          if (status == Status.error && errorChip != null) ...{errorChip},
          if (status == Status.info && infoChip != null) ...{infoChip},
        ],
      ),
    );
  }

  EufemiaRadio<T> copyWith({
    T groupValue,
    T value,
    Function(T) onChanged,
    Color unselectedColor,
    Color selectedColor,
    Color backgroundColor,
    Color errorColor,
    String label,
    Position labelPosition,
    Status status,
    Widget errorChip,
    Widget infoChip,
  }) {
    return EufemiaRadio<T>(
      groupValue: groupValue ?? this.groupValue,
      value: value ?? this.value,
      onChanged: onChanged ?? this.onChanged,
      unselectedColor: unselectedColor ?? this.unselectedColor,
      selectedColor: selectedColor ?? this.selectedColor,
      errorColor: errorColor ?? this.errorColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      label: label ?? this.label,
      labelPosition: labelPosition ?? this.labelPosition,
      status: status ?? this.status,
      errorChip: errorChip ?? this.errorChip,
      infoChip: infoChip ?? this.infoChip,
    );
  }
}
