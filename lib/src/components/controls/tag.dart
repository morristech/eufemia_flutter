import 'package:eufemia/components.dart';
import 'package:eufemia/palette.dart';
import 'package:eufemia/spacing.dart';
import 'package:eufemia/typography.dart';
import 'package:flutter/widgets.dart';

/// {@category Components}
/// {@subCategory Controls}
/// Tag from the Eufemia design system
class Tag extends StatelessWidget {
  /// {@macro eufemia.components.label}
  final String label;

  /// {@template eufemia.gestures.onDelete}
  /// The callback function that is called when component has been deleted.
  /// {@endtemplate}
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
