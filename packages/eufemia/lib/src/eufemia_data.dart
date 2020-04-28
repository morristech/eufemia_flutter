import 'package:eufemia_components/eufemia_components.dart';
import 'package:eufemia_palette/eufemia_palette.dart';
import 'package:eufemia_spacing/eufemia_spacing.dart';
import 'package:eufemia_typography/eufemia_typography.dart';

class EufemiaData {
  final EufemiaTypographyData typography;
  final EufemiaPaletteData palette;
  final EufemiaPaletteData darkPalette;
  final EufemiaSpacingData spacing;
  final EufemiaButtonThemeData button;

  EufemiaData({
    this.typography,
    this.palette,
    this.darkPalette,
    this.spacing,
    this.button,
  });
}
