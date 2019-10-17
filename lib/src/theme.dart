import 'dart:io';
import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const double _kDisplay4FontSize = 32.0;
const double _kSubtitleFontSize = 15.0;
const double _kSubheadFontSize = 17.0;
const double _kTitleFontSize = 20.0;
const String sfText = 'SF Pro Text';
const String sfDisplay = 'SF Pro Display';
const String fedraSans = 'FedraSansStd';
const double _kAppBarTitleFontSize = 17.0;
final Color _kStatusbarDarkColor = Colors.transparent;
final Color _kStatusbarLightColor = Colors.transparent;
final Color _kAppBarLightColor = Colors.white;
final Color _kAppBarDarkColor = EufemiaColors.oceanGreen;
final Color _kAppBarLightTitleColor = EufemiaColors.coal;
final Color _kAppBarDarkTitleColor = EufemiaColors.mintGreen;
final Color _kAppBarLightIconColor = EufemiaColors.seaGreenAlt;
final Color _kAppBarDarkIconColor = EufemiaColors.mintGreenAlt;
final Color _kSubtitleLightColor = EufemiaColors.darkGray;
final Color _kSubheadLightColor = EufemiaColors.coal;

class Eufemia {
  static ThemeData _lightThemeShared() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: EufemiaColors.mintGreen,
      accentColor: EufemiaColors.emeraldGreen,
      appBarTheme: AppBarTheme(
        brightness: Brightness.light,
        color: _kAppBarLightColor,
        textTheme: TextTheme(
          title: TextStyle(
            color: _kAppBarLightTitleColor,
            fontSize: _kAppBarTitleFontSize,
            fontFamily: Platform.isIOS ? sfText : fedraSans,
            package: 'eufemia',
          ),
        ),
        iconTheme: IconThemeData(color: _kAppBarLightIconColor),
      ),
      fontFamily: Platform.isIOS ? null : fedraSans,
      textTheme: Platform.isIOS
          ? TextTheme(
              display4: TextStyle(
                fontFamily: fedraSans,
                package: 'eufemia',
                fontSize: _kDisplay4FontSize,
              ),
              title:
                  TextStyle(fontFamily: sfDisplay, package: 'eufemia', fontSize: _kTitleFontSize),
              subtitle: TextStyle(
                fontSize: _kSubtitleFontSize,
                color: _kSubtitleLightColor,
                fontFamily: sfText,
                package: 'eufemia',
              ),
              subhead: TextStyle(
                color: _kSubheadLightColor,
                fontSize: _kSubheadFontSize,
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
        color: _kAppBarDarkColor,
        textTheme: TextTheme(
          title: TextStyle(
            color: _kAppBarDarkTitleColor,
            fontSize: _kAppBarTitleFontSize,
          ),
        ),
        iconTheme: IconThemeData(color: _kAppBarDarkIconColor),
      ),
      fontFamily: Platform.isIOS ? null : fedraSans,
      textTheme: Platform.isIOS
          ? TextTheme(
              display4: TextStyle(
                fontFamily: fedraSans,
                package: 'eufemia',
                fontSize: _kDisplay4FontSize,
              ),
              subtitle: TextStyle(
                fontSize: _kSubtitleFontSize,
                fontFamily: sfText,
                package: 'eufemia',
              ),
              subhead: TextStyle(
                fontSize: _kSubheadFontSize,
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
