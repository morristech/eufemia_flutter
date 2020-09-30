import 'package:eufemia/components.dart';
import 'package:eufemia/eufemia.dart';
import 'package:eufemia/palette.dart';
import 'package:eufemia/spacing.dart';
import 'package:eufemia/typography.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

/// A bundle of all [Eufemia] theme components.
class EufemiaData {
  /// The current [EufemiaTypographyData].
  final EufemiaTypographyData typography;

  /// The current [EufemiaPaletteData] for light themes.
  final EufemiaPaletteData palette;

  /// The current [EufemiaPaletteData] for dark themes.
  final EufemiaPaletteData darkPalette;

  /// The current [EufemiaSpacingData].
  final EufemiaSpacingData spacing;

  /// The current [EufemiaButtonThemeData].
  final EufemiaButtonThemeData button;

  EufemiaData({
    this.typography,
    this.palette,
    this.darkPalette,
    this.spacing,
    this.button,
  });

  /// Set the system's status bar color
  void updateStatusBarColor(Color color, [Brightness brightness]) {
    EufemiaThemeAdapter.setStatusBarColor(
      statusBarColor: color,
      brightness: brightness ?? palette.brightness,
    );
  }
}
