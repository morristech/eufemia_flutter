import 'dart:io';

import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final Color _kStatusbarDarkColor = EufemiaColors.emeraldGreen;
final Color _kStatusbarLightColor = EufemiaColors.mintGreen;

class Eufemia {
  static ThemeData _lightThemeShared() {
    return ThemeData(
      primaryColor: EufemiaColors.emeraldGreen,
      accentColor: EufemiaColors.mintGreen,
      textTheme: TextTheme(
        title: TextStyle(
          fontSize: 32,
          fontFamily: 'FedraSansStd',
        ),
      ),
    );
  }

  static ThemeData lightTheme() {
    setLightStatusbar();
    if (Platform.isIOS) {
      return iOSLightTheme();
    } else {
      return androidLightTheme();
    }
  }

  static ThemeData darkTheme() {
    setDarkStatusbar();
    return ThemeData();
  }

  static ThemeData iOSLightTheme() {
    return _lightThemeShared().copyWith(
      textTheme: _lightThemeShared().textTheme.copyWith(
            display1: TextStyle(
              fontFamily: 'FedraSansStd',
            ),
          ),
    );
  }

  static ThemeData androidLightTheme() {
    return _lightThemeShared().copyWith(
      textTheme: _lightThemeShared().textTheme.apply(
            fontFamily: 'FedraSansStd',
          ),
    );
  }

  static void setLightStatusbar() {
    SystemChrome.setSystemUIOverlayStyle(getOverlayStyle(Brightness.light));
  }

  static void setDarkStatusbar() {
    SystemChrome.setSystemUIOverlayStyle(getOverlayStyle(Brightness.dark));
  }

  static SystemUiOverlayStyle getOverlayStyle(Brightness brightness) {
    if (brightness == Brightness.dark) {
      return SystemUiOverlayStyle(
        // Only affects Android
        statusBarColor: _kStatusbarDarkColor,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      );
    } else {
      return SystemUiOverlayStyle(
        // Only affects Android
        statusBarColor: _kStatusbarLightColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      );
    }
  }
}
