import 'package:eufemia/eufemia.dart';
import 'package:eufemia/src/splash_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EufemiaThemeAdapter {
  final BuildContext context;
  final Color statusBarColor;

  EufemiaThemeAdapter(this.context, [this.statusBarColor]);

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
      snackBarTheme: SnackBarThemeData(
        elevation: 1,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
        backgroundColor: palette.snack,
        actionTextColor: palette.onSnack,
        contentTextStyle: typography.styles.subhead
            .copyWith(color: palette.white)
            .toTextStyle(context),
      ),
      iconTheme: IconThemeData(
        color: palette.icon,
        size: 22.0,
      ),
      appBarTheme: AppBarTheme(
        color: palette.primary,
        elevation: 0,
        iconTheme: IconThemeData(
          color: palette.onPrimary,
          size: 22.0,
        ),
        actionsIconTheme: IconThemeData(
          color: palette.onPrimary,
        ),
      ),
      splashFactory: NoSplashFactory(),
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
