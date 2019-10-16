import 'dart:io';
import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const double _kDisplay4Size = 32.0;
const double _kSubtitleSize = 15.0;
const double _kSubheadSize = 17.0;
final Color _kStatusbarDarkColor = Colors.transparent;
final Color _kStatusbarLightColor = Colors.transparent;
final Color _kAppBarLightColor = EufemiaColors.mintGreen;
final Color _kAppBarDarkColor = EufemiaColors.emeraldGreen;
final Color _kSubtitleColor = EufemiaColors.darkGray;
final Color _kSubheadColor = EufemiaColors.coal;

class Eufemia {
  static ThemeData _lightThemeShared() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: EufemiaColors.mintGreen,
      accentColor: EufemiaColors.emeraldGreen,
      appBarTheme: AppBarTheme(
        brightness: Brightness.light,
        color: _kAppBarLightColor,
      ),
      fontFamily: Platform.isIOS ? null : 'FedraSansStd',
      textTheme: Platform.isIOS
          ? TextTheme(
              display4: TextStyle(
                fontFamily: 'FedraSansStd',
                package: 'eufemia',
                fontSize: _kDisplay4Size,
              ),
              subtitle: TextStyle(
                fontSize: _kSubtitleSize,
                color: _kSubtitleColor,
                fontFamily: 'SF Pro Text',
              ),
              subhead: TextStyle(
                color: _kSubheadColor,
                fontSize: _kSubheadSize,
                fontFamily: 'SF Pro Text',
              ),
            )
          : TextTheme(),
    );
  }

  static ThemeData _darkThemeShared() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: EufemiaColors.emeraldGreen,
      accentColor: EufemiaColors.mintGreen,
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        color: _kAppBarDarkColor,
      ),
      fontFamily: Platform.isIOS ? null : 'FedraSansStd',
      textTheme: Platform.isIOS
          ? TextTheme(
              display4: TextStyle(
                fontFamily: 'FedraSansStd',
                package: 'eufemia',
                fontSize: 34.0,
              ),
            )
          : null,
    );
  }

  /// Returns the default Eufemia light theme, and sets the status bar brightness.
  ///
  /// [statusBarColor]: Sets the status bar color. Defaults to [Colors.transparent]
  static ThemeData lightTheme({Color statusBarColor}) {
    setLightStatusBar(statusBarColor: statusBarColor);
    return _lightThemeShared();
  }

  /// Returns the default Eufemia dark theme, and sets the status bar brightness.
  ///
  /// [statusBarColor]: Sets the status bar color. Defaults to [Colors.transparent]
  static ThemeData darkTheme({Color statusBarColor}) {
    setDarkStatusBar(statusBarColor: statusBarColor);
    return _darkThemeShared();
  }

  /// Sets the status bar brightness.
  ///
  /// [statusBarColor]: Sets the status bar color. Defaults to [Colors.transparent]
  static void setLightStatusBar({Color statusBarColor}) {
    statusBarColor ??= _kStatusbarLightColor;
    SystemChrome.setSystemUIOverlayStyle(getOverlayStyle(Brightness.light, statusBarColor));
  }

  /// Sets the status bar brightness.
  ///
  /// [statusBarColor]: Sets the status bar color. Defaults to [Colors.transparent]
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
        systemNavigationBarIconBrightness: Brightness.dark,
      );
    } else {
      return SystemUiOverlayStyle(
        // Only affects Android
        statusBarColor: statusBarColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      );
    }
  }
}
