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
    EufemiaTypographyData typography,
    EufemiaPaletteData palette,
    EufemiaPaletteData darkPalette,
    EufemiaSpacingData spacing,
    EufemiaButtonThemeData button,
  })  : typography = typography ?? EufemiaTypographyData.fallback(),
        palette = palette ?? EufemiaPaletteData.regular(),
        darkPalette = darkPalette ?? EufemiaPaletteData.dark(),
        spacing = spacing ?? EufemiaSpacingData.fallback(),
        button = button ?? EufemiaButtonThemeData.fallback();
}
