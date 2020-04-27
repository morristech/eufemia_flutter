import 'package:flutter/material.dart';
export 'package:recase/recase.dart';

extension EufemiaContextExtension on BuildContext {
  bool get bright => brightness == Brightness.light;
  bool get dark => brightness == Brightness.dark;
  bool get iOS => platform == TargetPlatform.iOS;
  bool get macOS => platform == TargetPlatform.macOS;
  bool get cupertino => iOS || macOS;
  bool get android => platform == TargetPlatform.android;
  bool get fuchsia => platform == TargetPlatform.fuchsia;
  bool get material => !cupertino;
  ThemeData get theme => Theme.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  TargetPlatform get platform => theme.platform;
  Brightness get brightness => theme.brightness;
  TextTheme get textTheme => theme.textTheme;
}
