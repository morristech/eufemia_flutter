import 'package:eufemia_components/eufemia_components.dart';
import 'package:eufemia_palette/eufemia_palette.dart';
import 'package:eufemia_spacing/eufemia_spacing.dart';
import 'package:eufemia_typography/eufemia_typography.dart';

class EufemiaData {
  final EufemiaTypographyData typography;
  final EufemiaPaletteData palette;
  final EufemiaSpacingData spacing;
  final EufemiaButtonThemeData button;

  const EufemiaData({
    this.typography,
    this.palette,
    this.spacing,
    this.button,
  });
}
