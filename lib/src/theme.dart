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

  /// Returns the default Eufemia light theme, and sets the status bar brightness.
  ///
  /// [statusBarColor]: Sets the status bar color. Defaults to [EufemiaColors.mintGreen]
  static ThemeData lightTheme({Color statusBarColor}) {
    setLightStatusBar(statusBarColor: statusBarColor);
    if (Platform.isIOS) {
      return _iOSLightTheme();
    } else {
      return _androidLightTheme();
    }
  }

  /// Returns the default Eufemia dark theme, and sets the status bar brightness.
  ///
  /// [statusBarColor]: Sets the status bar color. Defaults to [EufemiaColors.emeraldGreen]
  static ThemeData darkTheme({Color statusBarColor}) {
    setDarkStatusBar(statusBarColor: statusBarColor);
    return ThemeData();
  }

  static ThemeData _iOSLightTheme() {
    return _lightThemeShared().copyWith(
      textTheme: _lightThemeShared().textTheme.copyWith(
            display1: TextStyle(
              fontFamily: 'FedraSansStd',
            ),
          ),
    );
  }

  static ThemeData _androidLightTheme() {
    return _lightThemeShared().copyWith(
      textTheme: _lightThemeShared().textTheme.apply(
            fontFamily: 'FedraSansStd',
          ),
    );
  }

  /// Sets the status bar brightness.
  ///
  /// [statusBarColor]: Sets the status bar color. Defaults to [EufemiaColors.mintGreen]
  static void setLightStatusBar({Color statusBarColor}) {
    statusBarColor ??= _kStatusbarLightColor;
    SystemChrome.setSystemUIOverlayStyle(getOverlayStyle(Brightness.light, statusBarColor));
  }

  /// Sets the status bar brightness.
  ///
  /// [statusBarColor]: Sets the status bar color. Defaults to [EufemiaColors.emeraldGreen]
  static void setDarkStatusBar({Color statusBarColor}) {
    statusBarColor ??= _kStatusbarDarkColor;
    SystemChrome.setSystemUIOverlayStyle(getOverlayStyle(Brightness.dark, statusBarColor));
  }

  /// Returns a [SystemUiOverlayStyle] object which can be used with [SystemChrome] to
  /// well, set the System UI overlay style.
  ///
  /// [brightness]: The brightness of the status bar. Affects the icon brightness accordingly.
  /// [statusBarColor]: The color of the status bar. Should reflect the brightness given, e.g.
  /// a dark color for [Brightness.dark] to make the icons visible.
  static SystemUiOverlayStyle getOverlayStyle(Brightness brightness, Color statusBarColor) {
    if (brightness == Brightness.dark) {
      return SystemUiOverlayStyle(
        // Only affects Android
        statusBarColor: statusBarColor,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      );
    } else {
      return SystemUiOverlayStyle(
        // Only affects Android
        statusBarColor: statusBarColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      );
    }
  }
}
