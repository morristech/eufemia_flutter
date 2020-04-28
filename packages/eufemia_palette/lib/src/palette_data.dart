import 'package:eufemia_palette/eufemia_palette.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'util/color_json_converter.dart';

part 'palette_data.freezed.dart';
part 'palette_data.g.dart';

@freezed
abstract class EufemiaPaletteData with _$EufemiaPaletteData {
  const factory EufemiaPaletteData({
    @required Brightness brightness,
    @required @ColorJsonConverter() Color primary,
    @required @ColorJsonConverter() Color onPrimary,
    @required @ColorJsonConverter() Color secondary,
    @required @ColorJsonConverter() Color info,
    @required @ColorJsonConverter() Color success,
    @required @ColorJsonConverter() Color error,
    @required @ColorJsonConverter() Color warning,
    @required @ColorJsonConverter() Color dark,
    @required @ColorJsonConverter() Color light,
    @required @ColorJsonConverter() Color black,
    @required @ColorJsonConverter() Color grey,
    @required @ColorJsonConverter() Color white,
    @required @ColorJsonConverter() Color text,
    @required @ColorJsonConverter() Color buttonText,
    @required @ColorJsonConverter() Color iconColor,
    @required @ColorJsonConverter() Color cardColor,
    @required @ColorJsonConverter() Color cardAccentColor,
    @required @ColorJsonConverter() Color buttonColor,
    @required @ColorJsonConverter() Color toggledColor,
    @required @ColorJsonConverter() Color nonToggledColor,
  }) = _EufemiaPaletteData;

  factory EufemiaPaletteData.fallback() => const EufemiaPaletteData(
        brightness: Brightness.light,
        primary: EufemiaColors.white,
        onPrimary: EufemiaColors.seaGreen,
        info: EufemiaColors.seaGreen,
        secondary: EufemiaColors.emeraldGreen,
        error: EufemiaColors.fireRed,
        success: EufemiaColors.successGreen,
        warning: EufemiaColors.accentYellow,
        dark: EufemiaColors.coal,
        light: EufemiaColors.lightGray,
        white: EufemiaColors.white,
        black: EufemiaColors.coal,
        grey: EufemiaColors.darkGray,
        text: EufemiaColors.coal,
        buttonText: EufemiaColors.white,
        iconColor: EufemiaColors.emeraldGreen,
        cardColor: EufemiaColors.white,
        cardAccentColor: EufemiaColors.mintGreen,
        buttonColor: EufemiaColors.seaGreen,
        toggledColor: EufemiaColors.subtleGray,
        nonToggledColor: EufemiaColors.white,
      );

  factory EufemiaPaletteData.regular() => const EufemiaPaletteData(
        brightness: Brightness.light,
        primary: EufemiaColors.mintGreen,
        onPrimary: EufemiaColors.seaGreen,
        secondary: EufemiaColors.emeraldGreen,
        info: EufemiaColors.seaGreen,
        error: EufemiaColors.fireRed,
        success: EufemiaColors.successGreen,
        warning: EufemiaColors.accentYellow,
        dark: EufemiaColors.coal,
        light: EufemiaColors.lightGray,
        white: EufemiaColors.white,
        black: EufemiaColors.coal,
        grey: EufemiaColors.darkGray,
        text: EufemiaColors.coal,
        buttonText: EufemiaColors.white,
        iconColor: EufemiaColors.emeraldGreen,
        cardColor: EufemiaColors.white,
        cardAccentColor: EufemiaColors.mintGreen,
        buttonColor: EufemiaColors.seaGreen,
        toggledColor: EufemiaColors.subtleGray,
        nonToggledColor: EufemiaColors.white,
      );

  factory EufemiaPaletteData.saga() => const EufemiaPaletteData(
        brightness: Brightness.light,
        primary: EufemiaColors.sagaBackground,
        onPrimary: EufemiaColors.saga,
        secondary: EufemiaColors.saga,
        info: EufemiaColors.seaGreen,
        error: EufemiaColors.fireRed,
        success: EufemiaColors.successGreen,
        warning: EufemiaColors.accentYellow,
        dark: EufemiaColors.coal,
        light: EufemiaColors.lightGray,
        white: EufemiaColors.white,
        black: EufemiaColors.coal,
        grey: EufemiaColors.darkGray,
        text: EufemiaColors.coal,
        buttonText: EufemiaColors.coal,
        iconColor: EufemiaColors.sagaContrast,
        cardColor: EufemiaColors.white,
        cardAccentColor: EufemiaColors.sandYellow,
        buttonColor: EufemiaColors.saga,
        toggledColor: EufemiaColors.subtleGray,
        nonToggledColor: EufemiaColors.white,
      );

  factory EufemiaPaletteData.dark() => const EufemiaPaletteData(
        brightness: Brightness.dark,
        primary: EufemiaColors.gray6,
        onPrimary: EufemiaColors.mintGreen,
        secondary: EufemiaColors.mintGreen,
        info: EufemiaColors.seaGreen,
        error: EufemiaColors.fireRed,
        success: EufemiaColors.successGreen,
        warning: EufemiaColors.accentYellow,
        dark: EufemiaColors.coal,
        light: EufemiaColors.lightGray,
        white: EufemiaColors.white,
        black: EufemiaColors.coal,
        grey: EufemiaColors.darkGray,
        text: EufemiaColors.white,
        buttonText: EufemiaColors.emeraldGreen,
        iconColor: EufemiaColors.mintGreen,
        cardColor: EufemiaColors.gray6,
        cardAccentColor: EufemiaColors.gray5,
        buttonColor: EufemiaColors.mintGreen,
        toggledColor: EufemiaColors.darkGray,
        nonToggledColor: EufemiaColors.gray6,
      );

  factory EufemiaPaletteData.privateBanking() => const EufemiaPaletteData(
        brightness: Brightness.light,
        primary: EufemiaColors.pbBackground,
        onPrimary: EufemiaColors.outlineGray,
        secondary: EufemiaColors.lightGray,
        info: EufemiaColors.seaGreen,
        error: EufemiaColors.fireRed,
        success: EufemiaColors.successGreen,
        warning: EufemiaColors.accentYellow,
        dark: EufemiaColors.coal,
        light: EufemiaColors.lightGray,
        white: EufemiaColors.white,
        black: EufemiaColors.coal,
        grey: EufemiaColors.darkGray,
        text: EufemiaColors.coal,
        buttonText: EufemiaColors.pbBackground,
        iconColor: EufemiaColors.oceanGreen,
        cardColor: EufemiaColors.white,
        cardAccentColor: EufemiaColors.outlineGray,
        buttonColor: EufemiaColors.pbButton,
        toggledColor: EufemiaColors.subtleGray,
        nonToggledColor: EufemiaColors.white,
      );

  factory EufemiaPaletteData.fromJson(Map<String, dynamic> json) =>
      _$EufemiaPaletteDataFromJson(json);
}

extension EufemiaPaletteDataExtension on EufemiaPaletteData {
  bool get bright => brightness == Brightness.light;
  bool get dark => !bright;
}
