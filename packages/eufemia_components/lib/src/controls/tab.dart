import 'package:eufemia_components/src/utils/calculate_size.dart';
import 'package:eufemia_palette/eufemia_palette.dart';
import 'package:eufemia_spacing/eufemia_spacing.dart';
import 'package:eufemia_typography/eufemia_typography.dart';
import 'package:flutter/widgets.dart';

class EufemiaTab extends StatelessWidget {
  final String label;
  final bool active;
  final Function() onSelected;

  const EufemiaTab({
    Key key,
    @required this.label,
    this.active = false,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);
    final typography = EufemiaTypography.of(context);
    var style = active
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
              color: active ? palette.toggle : Color(0x00),
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
