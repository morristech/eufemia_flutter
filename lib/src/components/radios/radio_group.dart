import 'package:eufemia/src/components/radios/radio_button.dart';
import 'package:flutter/material.dart';

class EufemiaRadioGroup<T> extends StatelessWidget {
  final List<EufemiaRadio<T>> radios;
  final T value;
  final Function(T) onChanged;
  final Axis direction;
  final String label;

  const EufemiaRadioGroup({
    Key key,
    this.radios,
    this.value,
    this.onChanged,
    this.direction = Axis.horizontal,
    this.label,
  }) : super(key: key);

  /// Getter for changing [enabled] status
  bool get enabled => _isWidgetEnabled(this);

  /// Returns [true] if the given [EufemiaRawButton] has a non-null [onPressed] callback, else returns [false]
  bool _isWidgetEnabled(EufemiaRadioGroup widget) => widget.onChanged != null;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...{
          Padding(
            padding: const EdgeInsets.only(top: 5.0, right: 6.0),
            child: Text(label),
          )
        },
        _buildGroup(),
      ],
    );
  }

  Widget _buildGroup() {
    switch (direction) {
      case Axis.horizontal:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: _buildRadios(),
        );
      case Axis.vertical:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: _buildRadios(),
        );
      default:
        return null;
    }
  }

  /// Rebuilds the radios with a new [value] and [onChange] callback is redirected
  /// to the group
  List<Widget> _buildRadios() {
    return radios
        .map((radio) => radio.copyWith(
              groupValue: value,
              onChanged: onChanged,
              status: radio.status,
              errorChip: radio.errorChip,
              infoChip: radio.infoChip,
              errorColor: radio.errorColor,
            ))
        .toList();
  }
}
