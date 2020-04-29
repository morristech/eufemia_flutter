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
    @required @ColorJsonConverter() Color onInfo,
    @required @ColorJsonConverter() Color infoBackground,
    @required @ColorJsonConverter() Color success,
    @required @ColorJsonConverter() Color onSuccess,
    @required @ColorJsonConverter() Color successBackground,
    @required @ColorJsonConverter() Color error,
    @required @ColorJsonConverter() Color onError,
    @required @ColorJsonConverter() Color errorBackground,
    @required @ColorJsonConverter() Color warning,
    @required @ColorJsonConverter() Color onWarning,
    @required @ColorJsonConverter() Color warningBackground,
    @required @ColorJsonConverter() Color dark,
    @required @ColorJsonConverter() Color light,
    @required @ColorJsonConverter() Color black,
    @required @ColorJsonConverter() Color grey,
    @required @ColorJsonConverter() Color white,
    @required @ColorJsonConverter() Color text,
    @required @ColorJsonConverter() Color textLight,
    @required @ColorJsonConverter() Color onButton,
    @required @ColorJsonConverter() Color icon,
    @required @ColorJsonConverter() Color card,
    @required @ColorJsonConverter() Color cardAccent,
    @required @ColorJsonConverter() Color button,
    @required @ColorJsonConverter() Color toggle,
    @required @ColorJsonConverter() Color toggleInactive,
    @required @ColorJsonConverter() Color onToggle,
    @required @ColorJsonConverter() Color outline,
    @required @ColorJsonConverter() Color tag,
    @required @ColorJsonConverter() Color onTag,
  }) = _EufemiaPaletteData;

  factory EufemiaPaletteData.fallback() => const EufemiaPaletteData(
        brightness: Brightness.light,
        primary: EufemiaColors.white,
        onPrimary: EufemiaColors.seaGreen,
        info: EufemiaColors.seaGreen,
        onInfo: EufemiaColors.mintGreenAlt,
        onError: EufemiaColors.white,
        onWarning: EufemiaColors.coal,
        onSuccess: EufemiaColors.white,
        infoBackground: EufemiaColors.pistachio,
        errorBackground: EufemiaColors.emberRed,
        warningBackground: EufemiaColors.sandYellow,
        successBackground: EufemiaColors.pistachio,
        secondary: EufemiaColors.emeraldGreen,
        error: EufemiaColors.fireRed,
        success: EufemiaColors.successGreen,
        warning: EufemiaColors.accentYellow,
        dark: EufemiaColors.coal,
        light: EufemiaColors.softGray,
        white: EufemiaColors.white,
        black: EufemiaColors.coal,
        grey: EufemiaColors.darkGray,
        text: EufemiaColors.coal,
        textLight: EufemiaColors.darkGray,
        onButton: EufemiaColors.white,
        icon: EufemiaColors.emeraldGreen,
        card: EufemiaColors.white,
        cardAccent: EufemiaColors.mintGreen,
        button: EufemiaColors.seaGreen,
        toggle: EufemiaColors.subtleGray,
        toggleInactive: EufemiaColors.white,
        onToggle: EufemiaColors.white,
        outline: EufemiaColors.outlineGray,
        tag: EufemiaColors.outlineGray,
        onTag: EufemiaColors.coal,
      );

  factory EufemiaPaletteData.regular() => const EufemiaPaletteData(
        brightness: Brightness.light,
        primary: EufemiaColors.mintGreen,
        onPrimary: EufemiaColors.seaGreen,
        secondary: EufemiaColors.emeraldGreen,
        info: EufemiaColors.seaGreen,
        onInfo: EufemiaColors.mintGreenAlt,
        onError: EufemiaColors.white,
        onWarning: EufemiaColors.coal,
        onSuccess: EufemiaColors.white,
        infoBackground: EufemiaColors.pistachio,
        errorBackground: EufemiaColors.emberRed,
        warningBackground: EufemiaColors.sandYellow,
        successBackground: EufemiaColors.pistachio,
        error: EufemiaColors.fireRed,
        success: EufemiaColors.successGreen,
        warning: EufemiaColors.accentYellow,
        dark: EufemiaColors.coal,
        light: EufemiaColors.softGray,
        white: EufemiaColors.white,
        black: EufemiaColors.coal,
        grey: EufemiaColors.darkGray,
        text: EufemiaColors.coal,
        textLight: EufemiaColors.darkGray,
        onButton: EufemiaColors.white,
        icon: EufemiaColors.emeraldGreen,
        card: EufemiaColors.white,
        cardAccent: EufemiaColors.mintGreen,
        button: EufemiaColors.seaGreen,
        toggle: EufemiaColors.emeraldGreen,
        toggleInactive: EufemiaColors.white,
        onToggle: EufemiaColors.white,
        outline: EufemiaColors.outlineGray,
        tag: EufemiaColors.outlineGray,
        onTag: EufemiaColors.coal,
      );

  factory EufemiaPaletteData.saga() => const EufemiaPaletteData(
        brightness: Brightness.light,
        primary: EufemiaColors.sagaBackground,
        onPrimary: EufemiaColors.saga,
        secondary: EufemiaColors.saga,
        info: EufemiaColors.seaGreen,
        onInfo: EufemiaColors.mintGreenAlt,
        onError: EufemiaColors.white,
        onWarning: EufemiaColors.coal,
        onSuccess: EufemiaColors.white,
        infoBackground: EufemiaColors.pistachio,
        errorBackground: EufemiaColors.emberRed,
        warningBackground: EufemiaColors.sandYellow,
        successBackground: EufemiaColors.pistachio,
        error: EufemiaColors.fireRed,
        success: EufemiaColors.successGreen,
        warning: EufemiaColors.accentYellow,
        dark: EufemiaColors.coal,
        light: EufemiaColors.softGray,
        white: EufemiaColors.white,
        black: EufemiaColors.coal,
        grey: EufemiaColors.darkGray,
        text: EufemiaColors.coal,
        textLight: EufemiaColors.darkGray,
        onButton: EufemiaColors.coal,
        icon: EufemiaColors.sagaContrast,
        card: EufemiaColors.white,
        cardAccent: EufemiaColors.sandYellow,
        button: EufemiaColors.saga,
        toggle: EufemiaColors.sagaContrast,
        toggleInactive: EufemiaColors.white,
        onToggle: EufemiaColors.white,
        outline: EufemiaColors.outlineGray,
        tag: EufemiaColors.outlineGray,
        onTag: EufemiaColors.coal,
      );

  factory EufemiaPaletteData.dark() => const EufemiaPaletteData(
        brightness: Brightness.dark,
        primary: EufemiaColors.gray6,
        onPrimary: EufemiaColors.mintGreen,
        secondary: EufemiaColors.mintGreen,
        info: EufemiaColors.seaGreen,
        onInfo: EufemiaColors.mintGreenAlt,
        onError: EufemiaColors.white,
        onWarning: EufemiaColors.coal,
        onSuccess: EufemiaColors.white,
        infoBackground: EufemiaColors.pistachio,
        errorBackground: EufemiaColors.emberRed,
        warningBackground: EufemiaColors.sandYellow,
        successBackground: EufemiaColors.pistachio,
        error: EufemiaColors.fireRed,
        success: EufemiaColors.successGreen,
        warning: EufemiaColors.accentYellow,
        dark: EufemiaColors.coal,
        light: EufemiaColors.gray2,
        white: EufemiaColors.white,
        black: EufemiaColors.coal,
        grey: EufemiaColors.darkGray,
        text: EufemiaColors.white,
        textLight: EufemiaColors.softGray,
        onButton: EufemiaColors.emeraldGreen,
        icon: EufemiaColors.mintGreen,
        card: EufemiaColors.gray6,
        cardAccent: EufemiaColors.gray5,
        button: EufemiaColors.mintGreen,
        toggle: EufemiaColors.mintGreen,
        toggleInactive: EufemiaColors.gray6,
        onToggle: EufemiaColors.emeraldGreen,
        outline: EufemiaColors.gray3,
        tag: EufemiaColors.outlineGray,
        onTag: EufemiaColors.coal,
      );

  factory EufemiaPaletteData.privateBanking() => const EufemiaPaletteData(
        brightness: Brightness.light,
        primary: EufemiaColors.pbBackground,
        secondary: EufemiaColors.lightGray,
        onPrimary: EufemiaColors.outlineGray,
        info: EufemiaColors.seaGreen,
        onInfo: EufemiaColors.mintGreenAlt,
        onError: EufemiaColors.white,
        onWarning: EufemiaColors.coal,
        onSuccess: EufemiaColors.white,
        infoBackground: EufemiaColors.pistachio,
        errorBackground: EufemiaColors.emberRed,
        warningBackground: EufemiaColors.sandYellow,
        successBackground: EufemiaColors.pistachio,
        error: EufemiaColors.fireRed,
        success: EufemiaColors.successGreen,
        warning: EufemiaColors.accentYellow,
        dark: EufemiaColors.coal,
        light: EufemiaColors.softGray,
        white: EufemiaColors.white,
        black: EufemiaColors.coal,
        grey: EufemiaColors.darkGray,
        text: EufemiaColors.coal,
        textLight: EufemiaColors.darkGray,
        onButton: EufemiaColors.pbBackground,
        icon: EufemiaColors.oceanGreen,
        card: EufemiaColors.white,
        cardAccent: EufemiaColors.outlineGray,
        button: EufemiaColors.pbButton,
        toggle: EufemiaColors.oceanGreen,
        toggleInactive: EufemiaColors.white,
        onToggle: EufemiaColors.white,
        outline: EufemiaColors.outlineGray,
        tag: EufemiaColors.outlineGray,
        onTag: EufemiaColors.coal,
      );

  factory EufemiaPaletteData.fromJson(Map<String, dynamic> json) =>
      _$EufemiaPaletteDataFromJson(json);
}

extension EufemiaPaletteDataExtension on EufemiaPaletteData {
  bool get bright => brightness == Brightness.light;
  bool get dark => !bright;
}
