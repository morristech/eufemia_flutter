import 'dart:ui';
import 'package:eufemia/src/components/bottom_tab_bar/tab_icon.dart';
import 'package:meta/meta.dart';

class TabItem {
  final TabIcon icon;
  final String label;
  final VoidCallback onLongPressed;

  TabItem({
    @required this.icon,
    this.onLongPressed,
    this.label,
  });
}
