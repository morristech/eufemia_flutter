import 'package:flutter/widgets.dart';
import 'package:eufemia/palette.dart';
import 'package:eufemia/typography.dart';

/// {@category Core}
/// A default [EufemiaTypography] theme.
class EufemiaDefaultTypography extends StatefulWidget {
  final Widget child;
  final EufemiaTypographyData data;

  const EufemiaDefaultTypography({
    Key key,
    this.data,
    @required this.child,
  }) : super(key: key);

  @override
  _EufemiaDefaultTypographyState createState() =>
      _EufemiaDefaultTypographyState();
}

class _EufemiaDefaultTypographyState extends State<EufemiaDefaultTypography> {
  EufemiaTypographyData fallback(BuildContext context) {
    final palette = EufemiaPalette.of(context);
    return EufemiaTypographyData.fallback(
      subheadColor: palette.textLight,
      subheadEmphasizedColor: palette.text,
      footnoteColor: palette.text,
      footnoteEmphasizedColor: palette.text,
      bodyEmphasizedColor: palette.text,
      bodyColor: palette.text,
      titleDemiColor: palette.text,
      titleEmphasizedColor: palette.text,
      titleLargeColor: palette.text,
      titleMediumColor: palette.text,
      titleMediumEmphasizedColor: palette.text,
      titleColor: palette.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return EufemiaTypography(
      data: widget.data ?? fallback(context),
      child: widget.child,
    );
  }
}
