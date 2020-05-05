import 'package:eufemia/eufemia.dart';
import 'package:flutter/widgets.dart';

class Tag extends StatelessWidget {
  final String label;
  final VoidCallback onDelete;

  const Tag({
    Key key,
    this.label,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);
    final typography = EufemiaTypography.of(context);
    final style = typography.styles.footnote
        .copyWith(color: palette.onTag)
        .toTextStyle(context);

    return Container(
      decoration: BoxDecoration(
        color: palette.tag,
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: EufemiaRow(
        padding: EufemiaInsets.allSmall,
        mainAxisSize: MainAxisSize.min,
        spaceBetween: EufemiaSpace.extraSmall,
        children: [
          Icon(EufemiaIcons.clear, color: palette.dark),
          Text(label, style: style),
        ],
      ),
    );
  }
}
