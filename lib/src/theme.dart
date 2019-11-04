import 'dart:io';
import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const double _Display4FontSize = 32.0;
const double _subtitleFontSize = 15.0;
const double _subheadFontSize = 17.0;
const double _titleFontSize = 20.0;
const String sfText = 'SF Pro Text';
const String sfDisplay = 'SF Pro Display';
const String fedraSans = 'FedraSansStd';
const double _appBarTitleFontSize = 17.0;
final Color _statusbarDarkColor = Colors.transparent;
final Color _statusbarLightColor = Colors.transparent;
final Color _appBarLightColor = Colors.white;
final Color _appBarDarkColor = EufemiaColors.oceanGreen;
final Color _appBarLightTitleColor = EufemiaColors.coal;
final Color _appBarDarkTitleColor = EufemiaColors.mintGreen;
final Color _appBarLightIconColor = EufemiaColors.seaGreenAlt;
final Color _appBarDarkIconColor = EufemiaColors.mintGreenAlt;
final Color _subtitleLightColor = EufemiaColors.darkGray;
final Color _subheadLightColor = EufemiaColors.coal;

class Eufemia {
  static ThemeData _lightThemeShared() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: EufemiaColors.mintGreen,
      accentColor: EufemiaColors.emeraldGreen,
      appBarTheme: AppBarTheme(
        brightness: Brightness.light,
        color: _appBarLightColor,
        textTheme: TextTheme(
          title: TextStyle(
            color: _appBarLightTitleColor,
            fontSize: _appBarTitleFontSize,
            fontFamily: Platform.isIOS ? sfText : fedraSans,
            fontWeight: FontWeight.bold,
            package: 'eufemia',
          ),
        ),
        iconTheme: IconThemeData(color: _appBarLightIconColor),
      ),
      fontFamily: Platform.isIOS ? null : fedraSans,
      textTheme: Platform.isIOS
          ? TextTheme(
              display4: TextStyle(
                fontFamily: fedraSans,
                package: 'eufemia',
                fontSize: _Display4FontSize,
              ),
              title: TextStyle(fontFamily: sfDisplay, package: 'eufemia', fontSize: _titleFontSize),
              subtitle: TextStyle(
                fontSize: _subtitleFontSize,
                color: _subtitleLightColor,
                fontFamily: sfText,
                package: 'eufemia',
              ),
              subhead: TextStyle(
                color: _subheadLightColor,
                fontSize: _subheadFontSize,
                fontFamily: sfText,
                package: 'eufemia',
              ),
            )
          : null,
    );
  }

  static ThemeData _darkThemeShared() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: EufemiaColors.emeraldGreen,
      accentColor: EufemiaColors.mintGreen,
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        color: _appBarDarkColor,
        textTheme: TextTheme(
          title: TextStyle(
            color: _appBarDarkTitleColor,
            fontSize: _appBarTitleFontSize,
            fontWeight: FontWeight.bold,
            fontFamily: Platform.isIOS ? sfText : fedraSans,
          ),
        ),
        iconTheme: IconThemeData(color: _appBarDarkIconColor),
      ),
      fontFamily: Platform.isIOS ? null : fedraSans,
      textTheme: Platform.isIOS
          ? TextTheme(
              display4: TextStyle(
                fontFamily: fedraSans,
                package: 'eufemia',
                fontSize: _Display4FontSize,
              ),
              subtitle: TextStyle(
                fontSize: _subtitleFontSize,
                fontFamily: sfText,
                package: 'eufemia',
              ),
              subhead: TextStyle(
                fontSize: _subheadFontSize,
                fontFamily: sfText,
                package: 'eufemia',
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
    statusBarColor ??= _statusbarLightColor;
    SystemChrome.setSystemUIOverlayStyle(getOverlayStyle(Brightness.light, statusBarColor));
  }

  /// Sets the status bar brightness.
  ///
  /// [statusBarColor]: Sets the status bar color. Defaults to [Colors.transparent]
  static void setDarkStatusBar({Color statusBarColor}) {
    statusBarColor ??= _statusbarDarkColor;
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
