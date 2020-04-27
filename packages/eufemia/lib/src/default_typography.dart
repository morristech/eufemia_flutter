import 'package:flutter/widgets.dart';
import 'package:eufemia_palette/eufemia_palette.dart';
import 'package:eufemia_typography/eufemia_typography.dart';

class EufemiaDefaultTypography extends StatelessWidget {
  final Widget child;
  final EufemiaTypographyData data;

  const EufemiaDefaultTypography({
    Key key,
    this.data,
    @required this.child,
  }) : super(key: key);

  EufemiaTypographyData fallback(BuildContext context) {
    final palette = EufemiaPalette.of(context);
    return EufemiaTypographyData.fallback(
      bodyColor: palette.dark,
      titleColor: palette.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return EufemiaTypography(
      data: data ?? fallback(context),
      child: child,
    );
  }
}
