import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EufemiaThemeAdapter {
  final BuildContext context;
  final Color statusBarColor;

  EufemiaThemeAdapter({@required this.context, this.statusBarColor});

  ThemeData get theme {
    final eufemia = Eufemia.of(context);
    final typography = eufemia.typography;
    final palette = eufemia.palette;

    if (statusBarColor != null) {
      setStatusBarColor(
        statusBarColor: statusBarColor ?? palette.secondary,
        brightness: palette.brightness,
      );
    }

    return ThemeData(
      brightness: palette.brightness,
      primaryColor: palette.primary,
      accentColor: palette.secondary,
      fontFamily: typography.families.primary,
      canvasColor: palette.canvas,
      cursorColor: palette.secondary,
      textSelectionColor: palette.accent,
      iconTheme: IconThemeData(
        color: palette.icon,
        size: 24.0,
      ),
      appBarTheme: AppBarTheme(
        color: palette.primary,
        iconTheme: IconThemeData(
          color: palette.onPrimary,
        ),
        actionsIconTheme: IconThemeData(
          color: palette.onPrimary,
        ),
      ),
    );
  }

  /// Returns a [SystemUiOverlayStyle] object which can be used with [SystemChrome] to
  /// well, set the System UI overlay style.
  ///
  /// [brightness]: The brightness of the status bar. Affects the icon brightness accordingly.
  /// [statusBarColor]: The color of the status bar. Should reflect the brightness given, e.g.
  /// a dark color for [Brightness.dark] to make the icons visible.
  static SystemUiOverlayStyle getOverlayStyle(
    Brightness brightness,
    Color statusBarColor,
  ) {
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

  /// [statusBarColor]: Sets the status bar color. Defaults to [Colors.transparent]
  static void setStatusBarColor({Color statusBarColor, Brightness brightness}) {
    SystemChrome.setSystemUIOverlayStyle(
      getOverlayStyle(
        brightness,
        statusBarColor,
      ),
    );
  }
}
