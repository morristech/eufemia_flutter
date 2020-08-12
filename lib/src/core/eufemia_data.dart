import 'package:eufemia/components.dart';
import 'package:eufemia/eufemia.dart';
import 'package:eufemia/palette.dart';
import 'package:eufemia/spacing.dart';
import 'package:eufemia/typography.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class EufemiaData {
  final EufemiaTypographyData typography;
  final EufemiaPaletteData palette;
  final EufemiaPaletteData darkPalette;
  final EufemiaSpacingData spacing;
  final EufemiaButtonThemeData button;
  final bool isStandaloneApp;

  EufemiaData({
    this.typography,
    this.palette,
    this.darkPalette,
    this.spacing,
    this.button,
    this.isStandaloneApp = true,
  });

  void updateStatusBarColor(Color color, [Brightness brightness]) {
    EufemiaThemeAdapter.setStatusBarColor(
      statusBarColor: color,
      brightness: brightness ?? palette.brightness,
    );
  }
}
