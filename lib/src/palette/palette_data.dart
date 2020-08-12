import 'package:eufemia/palette.dart';
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
    @required @ColorJsonConverter() Color cardLabel,
    @required @ColorJsonConverter() Color accent,
    @required @ColorJsonConverter() Color button,
    @required @ColorJsonConverter() Color toggle,
    @required @ColorJsonConverter() Color toggleInactive,
    @required @ColorJsonConverter() Color onToggle,
    @required @ColorJsonConverter() Color outline,
    @required @ColorJsonConverter() Color tag,
    @required @ColorJsonConverter() Color onTag,
    @required @ColorJsonConverter() Color shadow,
    @required @ColorJsonConverter() Color canvas,
    @required @ColorJsonConverter() Color search,
    @required @ColorJsonConverter() Color onSearch,
    @required @ColorJsonConverter() Color onSearchInactive,
    @required @ColorJsonConverter() Color snack,
    @required @ColorJsonConverter() Color onSnack,
    @required @ColorJsonConverter() Color shimmerBase,
    @required @ColorJsonConverter() Color shimmerHighlight,
    @required @ColorJsonConverter() Color navbarTitle,
  }) = _EufemiaPaletteData;

  factory EufemiaPaletteData.fallback() => EufemiaPaletteData(
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
        accent: EufemiaColors.mintGreenAlt,
        button: EufemiaColors.seaGreen,
        toggle: EufemiaColors.subtleGray,
        toggleInactive: EufemiaColors.white,
        onToggle: EufemiaColors.white,
        outline: EufemiaColors.outlineGray,
        tag: EufemiaColors.outlineGray,
        onTag: EufemiaColors.coal,
        cardLabel: EufemiaColors.subtleGray,
        shadow: EufemiaColors.lightShadow,
        canvas: EufemiaColors.lightGray,
        search: EufemiaColors.searchField,
        onSearch: EufemiaColors.coal,
        onSearchInactive: EufemiaColors.darkGray,
        snack: EufemiaColors.coal,
        onSnack: EufemiaColors.white,
        shimmerBase: EufemiaColors.coal.withOpacity(.08),
        shimmerHighlight: EufemiaColors.white.withOpacity(.18),
        navbarTitle: EufemiaColors.emeraldGreen,
      );

  factory EufemiaPaletteData.regular() => EufemiaPaletteData(
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
        accent: EufemiaColors.mintGreenAlt,
        cardLabel: EufemiaColors.subtleGray,
        button: EufemiaColors.seaGreen,
        toggle: EufemiaColors.emeraldGreen,
        toggleInactive: EufemiaColors.white,
        onToggle: EufemiaColors.white,
        outline: EufemiaColors.outlineGray,
        tag: EufemiaColors.outlineGray,
        onTag: EufemiaColors.coal,
        shadow: EufemiaColors.lightShadow,
        canvas: EufemiaColors.lightGray,
        search: EufemiaColors.searchField,
        onSearch: EufemiaColors.coal,
        onSearchInactive: EufemiaColors.darkGray,
        snack: EufemiaColors.coal,
        onSnack: EufemiaColors.mintGreen,
        shimmerBase: EufemiaColors.coal.withOpacity(.08),
        shimmerHighlight: EufemiaColors.white.withOpacity(.18),
        navbarTitle: EufemiaColors.emeraldGreen,
      );

  factory EufemiaPaletteData.saga() => EufemiaPaletteData(
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
        accent: EufemiaColors.sandYellow,
        cardLabel: EufemiaColors.subtleGray,
        button: EufemiaColors.saga,
        toggle: EufemiaColors.sagaContrast,
        toggleInactive: EufemiaColors.white,
        onToggle: EufemiaColors.white,
        outline: EufemiaColors.outlineGray,
        tag: EufemiaColors.outlineGray,
        onTag: EufemiaColors.coal,
        shadow: EufemiaColors.lightShadow,
        canvas: EufemiaColors.lightGray,
        search: EufemiaColors.searchDark,
        onSearch: EufemiaColors.white,
        onSearchInactive: EufemiaColors.whiteLight,
        snack: EufemiaColors.coal,
        onSnack: EufemiaColors.saga,
        shimmerBase: EufemiaColors.coal.withOpacity(.08),
        shimmerHighlight: EufemiaColors.white.withOpacity(.18),
        navbarTitle: EufemiaColors.white,
      );

  factory EufemiaPaletteData.dark() => EufemiaPaletteData(
        brightness: Brightness.dark,
        primary: EufemiaColors.gray6,
        onPrimary: EufemiaColors.mintGreen,
        secondary: EufemiaColors.mintGreen,
        info: EufemiaColors.seaGreen,
        onInfo: EufemiaColors.mintGreenAlt,
        onError: EufemiaColors.white,
        onWarning: EufemiaColors.coal,
        onSuccess: EufemiaColors.white,
        infoBackground: EufemiaColors.mintGreen.withOpacity(0.4),
        errorBackground: EufemiaColors.fireRed.withOpacity(0.4),
        warningBackground: EufemiaColors.accentYellow.withOpacity(0.4),
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
        accent: EufemiaColors.gray5,
        cardLabel: EufemiaColors.gray5,
        button: EufemiaColors.mintGreen,
        toggle: EufemiaColors.mintGreen,
        toggleInactive: EufemiaColors.gray6,
        onToggle: EufemiaColors.emeraldGreen,
        outline: EufemiaColors.gray3,
        tag: EufemiaColors.outlineGray,
        onTag: EufemiaColors.coal,
        shadow: EufemiaColors.darkShadow,
        canvas: EufemiaColors.black,
        search: EufemiaColors.searchDark,
        onSearch: EufemiaColors.white,
        onSearchInactive: EufemiaColors.whiteLight,
        snack: EufemiaColors.coal,
        onSnack: EufemiaColors.mintGreen,
        shimmerBase: EufemiaColors.white.withOpacity(.16),
        shimmerHighlight: EufemiaColors.white.withOpacity(.18),
        navbarTitle: EufemiaColors.white,
      );

  factory EufemiaPaletteData.privateBanking() => EufemiaPaletteData(
        brightness: Brightness.light,
        primary: EufemiaColors.pbBackground,
        secondary: EufemiaColors.subtleGray,
        onPrimary: EufemiaColors.subtleGray,
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
        accent: EufemiaColors.outlineGray,
        cardLabel: EufemiaColors.subtleGray,
        button: EufemiaColors.pbButton,
        toggle: EufemiaColors.oceanGreen,
        toggleInactive: EufemiaColors.white,
        onToggle: EufemiaColors.white,
        outline: EufemiaColors.outlineGray,
        tag: EufemiaColors.outlineGray,
        onTag: EufemiaColors.coal,
        shadow: EufemiaColors.lightShadow,
        canvas: EufemiaColors.lightGray,
        search: EufemiaColors.searchDark,
        onSearch: EufemiaColors.white,
        onSearchInactive: EufemiaColors.whiteLight,
        snack: EufemiaColors.coal,
        onSnack: EufemiaColors.subtleGray,
        shimmerBase: EufemiaColors.coal.withOpacity(.08),
        shimmerHighlight: EufemiaColors.white.withOpacity(.18),
        navbarTitle: EufemiaColors.white,
      );

  factory EufemiaPaletteData.fromJson(Map<String, dynamic> json) =>
      _$EufemiaPaletteDataFromJson(json);
}

extension EufemiaPaletteDataExtension on EufemiaPaletteData {
  bool get bright => brightness == Brightness.light;
  bool get dark => !bright;
}