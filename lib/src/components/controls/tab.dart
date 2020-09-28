import 'package:eufemia/palette.dart';
import 'package:eufemia/spacing.dart';
import 'package:eufemia/src/components/utils/calculate_size.dart';
import 'package:eufemia/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EufemiaTab extends StatelessWidget {
  /// The text to display for the tab
  final String label;

  /// Explicit status of the tab. Can't be used if [index] is set.
  final bool active;

  /// Callback for tap interaction
  final Function() onSelected;

  /// Index of the tab that sets the [active] status from the context's [DefaultTabController]. Can't be used if
  /// [active] is set.
  final int index;

  const EufemiaTab({
    Key key,
    @required this.label,
    this.active,
    this.onSelected,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);
    final typography = EufemiaTypography.of(context);

    final _active = active ?? DefaultTabController.of(context).index == index;

    var style = _active
        ? typography.styles.buttonSmallEmphasized
        : typography.styles.buttonSmall;

    final size = calculateSize(
      label,
      typography.styles.buttonSmall.toTextStyle(context),
    );

    return GestureDetector(
      onTap: onSelected,
      child: AnimatedContainer(
        // Width + padding
        width: size.width + 26,
        duration: Duration(milliseconds: 50),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: _active ? palette.toggle : Color(0x00),
              width: 2.0,
            ),
          ),
        ),
        child: EufemiaPadding.extraSmall(
          child: Center(
            child: DefaultTextStyle(
              child: Text(label),
              style: style.copyWith(color: palette.toggle).toTextStyle(context),
            ),
          ),
        ),
      ),
    );
  }
}
