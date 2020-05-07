import 'package:eufemia_palette/eufemia_palette.dart';
import 'package:eufemia_typography/eufemia_typography.dart';
import 'package:flutter/widgets.dart';

/// Toggle label from the Eufemia Design System
class Toggle extends StatelessWidget {
  final bool selected;
  final String label;
  final Function(bool) onChange;

  /// Toggle label from the Eufemia Design System
  ///
  /// * [selected]: If the label is toggled or not
  /// * [label]: The label
  /// * [onChange]: Callback for when the the label is pressed
  const Toggle({
    Key key,
    this.selected,
    this.label,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);
    final typography = EufemiaTypography.of(context);

    final style = typography.styles.button
        .copyWith(color: selected ? palette.onToggle : palette.toggle)
        .toTextStyle(context);

    return GestureDetector(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 50),
        decoration: BoxDecoration(
          color: selected ? palette.toggle : palette.toggleInactive,
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(
            color: palette.toggle,
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.5, horizontal: 16.0),
          child: Text(
            label,
            style: style,
          ),
        ),
      ),
      onTap: () => onChange?.call(!selected),
    );
  }
}
