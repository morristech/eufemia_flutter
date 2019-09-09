import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class EufemiaAppBars {
  static AppBar standard({
    String title,
    Widget icon,
    List<Widget> actions,
    VoidCallback onBackPressed,
    bool automaticallyImplyLeading = true,
    Widget leading,
  }) {
    return AppBar(
      leading: automaticallyImplyLeading
          ? IconButton(
              icon: Icon(EufemiaIcons.chevron_left),
              onPressed: onBackPressed,
            )
          : leading,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (icon != null) ...{
            Padding(
              child: icon,
              padding: const EdgeInsets.only(right: 8.0),
            )
          },
          Text(title),
        ],
      ),
      elevation: 0,
    );
  }
}
