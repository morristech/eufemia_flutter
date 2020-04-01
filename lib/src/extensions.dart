import 'package:flutter/material.dart';
export 'package:recase/recase.dart';

extension EufemiaContextExtension on BuildContext {
  bool get bright => this.brightness == Brightness.light;
  bool get dark => this.brightness == Brightness.dark;
  bool get iOS => this.platform == TargetPlatform.iOS;
  bool get macOS => this.platform == TargetPlatform.macOS;
  bool get cupertino => this.iOS || this.macOS;
  bool get android => this.platform == TargetPlatform.android;
  bool get fuchsia => this.platform == TargetPlatform.fuchsia;
  bool get material => !this.cupertino;
  ThemeData get theme => Theme.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  TargetPlatform get platform => this.theme.platform;
  Brightness get brightness => this.theme.brightness;
  TextTheme get textTheme => this.theme.textTheme;
}
