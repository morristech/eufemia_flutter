import 'package:eufemia/palette.dart';
import 'package:eufemia/typography.dart';
import 'package:flutter/widgets.dart';

/// {@category Components}
/// {@subCategory Controls}
/// Toggle label from the Eufemia Design System
class Toggle extends StatelessWidget {
  /// {@macro eufemia.components.controls.value}
  final bool selected;

  /// {@macro eufemia.components.label}
  final String label;

  /// {@macro eufemia.gestures.onChanged}
  final Function(bool) onChanged;

  const Toggle({
    Key key,
    this.selected,
    this.label,
    this.onChanged,
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
      onTap: () => onChanged?.call(!selected),
    );
  }
}
