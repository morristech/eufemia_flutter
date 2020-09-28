import 'package:eufemia/palette.dart';
import 'package:eufemia/spacing.dart';
import 'package:eufemia/src/components/utils/calculate_size.dart';
import 'package:eufemia/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// A tab to be displayed as a part of a [EufemiaTabBar] widget.
class EufemiaTab extends StatelessWidget {
  /// The text to display for the tab
  final String label;

  /// A [TabController] to control the behaviour. Prefer using a [DefaultTabController].
  final TabController controller;

  /// Callback for tap interaction.
  final Function() onSelected;

  /// Index of the tab that sets the [active] status from the context's [DefaultTabController].
  final int index;

  const EufemiaTab({
    Key key,
    @required this.label,
    this.controller,
    this.onSelected,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);
    final typography = EufemiaTypography.of(context);
    final _controller = controller ?? DefaultTabController.of(context);

    final _active = _controller.index == index;

    var style = _active ? typography.styles.buttonSmallEmphasized : typography.styles.buttonSmall;

    final size = calculateSize(
      label,
      typography.styles.buttonSmall.toTextStyle(context),
    );

    return Semantics(
      selected: _active,
      value: 'Tab ${index + 1} of ${_controller.length}',
      child: GestureDetector(
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
      ),
    );
  }
}
