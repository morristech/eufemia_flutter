import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const double _iconSize = 16.0;
const String inter = 'Inter';
final Color _statusbarDarkColor = Colors.transparent;
final Color _statusbarLightColor = Colors.transparent;
final Color _appBarLightColor = Colors.white;
final Color _appBarDarkColor = Colors.black;
final Color _appBarLightIconColor = EufemiaColors.seaGreenAlt;
final Color _appBarDarkIconColor = Colors.white;

class Eufemia {
  static ThemeData _lightThemeShared() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: EufemiaColors.mintGreen,
      accentColor: EufemiaColors.emeraldGreen,
      appBarTheme: AppBarTheme(
        brightness: Brightness.light,
        color: _appBarLightColor,
        iconTheme: IconThemeData(color: _appBarLightIconColor, size: _iconSize),
      ),
      fontFamily: inter,
      textTheme: lightTextTheme,
    );
  }

  static ThemeData _darkThemeShared() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: EufemiaColors.emeraldGreen,
      accentColor: EufemiaColors.mintGreen,
      canvasColor: Colors.black,
      cardColor: EufemiaColors.coal,
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        color: _appBarDarkColor,
        iconTheme: IconThemeData(color: _appBarDarkIconColor, size: _iconSize),
      ),
      textTheme: darkTextTheme,
    );
  }

  static TextTheme get lightTextTheme {
    return TextTheme(
      display1: titleLarge.copyWith(color: EufemiaColors.coal),
      headline: titleMedium.copyWith(color: EufemiaColors.coal),
      title: title.copyWith(color: EufemiaColors.coal),
      subhead: subhead.copyWith(color: EufemiaColors.coal),
      body1: body.copyWith(color: EufemiaColors.coal),
      body2: bodyEmphasized.copyWith(color: EufemiaColors.coal),
      caption: caption.copyWith(color: EufemiaColors.coal),
      subtitle: footnote.copyWith(color: EufemiaColors.coal),
    );
  }

  static TextTheme get darkTextTheme {
    return TextTheme(
      display1: titleLarge.copyWith(color: Colors.white),
      headline: titleMedium.copyWith(color: Colors.white),
      title: title.copyWith(color: Colors.white),
      subhead: subhead.copyWith(color: Colors.white),
      body1: body.copyWith(color: Colors.white),
      body2: bodyEmphasized.copyWith(color: Colors.white),
      caption: caption.copyWith(color: Colors.white),
      subtitle: footnote.copyWith(color: Colors.white),
    );
  }

  // Text styles

  ///Large button
  static TextStyle get buttonLarge => TextStyle(
        fontSize: 16.0,
        height: 1.2,
      );

  static TextStyle get buttonSmall => TextStyle(
        fontSize: 14.0,
        height: 1.2,
      );

  /// 34pt Bold
  static TextStyle get titleLarge => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 34,
        height: 1.2,
      );

  /// 24pt Regular
  static TextStyle get titleMedium => TextStyle(
        fontSize: 24,
        height: 1.2,
      );

  /// 24pt Bold
  static TextStyle get titleMediumEmphasized => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        height: 1.2,
      );

  /// 20pt Regular
  static TextStyle get title => TextStyle(
        fontSize: 20,
        height: 1.2,
      );

  /// 20pt Semibold
  static TextStyle get titleDemi => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        height: 1.2,
      );

  /// 20pt Bold
  static TextStyle get titleEmphasized => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        height: 1.2,
      );

  ///  17pt Regular
  static TextStyle get body => TextStyle(
        fontSize: 17,
        height: 1.2,
      );

  /// 17pt Bold
  static TextStyle get bodyEmphasized => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
        height: 1.2,
      );

  /// 15pt Regular
  static TextStyle get subhead => TextStyle(
        fontSize: 15,
        height: 1.2,
      );

  /// 15pt Bold
  static TextStyle get subheadEmphasized => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        height: 1.2,
      );

  /// 13pt Regular
  static TextStyle get footnote => TextStyle(
        fontSize: 13,
        height: 1.2,
      );

  /// 13pt Bold
  static TextStyle get footnoteEmphasized => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 13,
        height: 1.2,
      );

  /// 11pt Regular
  static TextStyle get caption => TextStyle(
        fontSize: 11,
        height: 1.2,
      );

  /// 11pt Bold
  static TextStyle get captionEmphasized => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 11,
        height: 1.2,
      );

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
