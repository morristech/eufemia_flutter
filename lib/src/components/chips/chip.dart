import 'package:eufemia/src/icons/icons.dart';
import 'package:eufemia/src/style/colors.dart';
import 'package:flutter/material.dart';

class EufemiaChips {
  static error({String text, IconData icon = EufemiaIcons.error_medium}) {
    return Chip(
      padding: EdgeInsets.zero,
      backgroundColor: EufemiaColors.cherryRed8,
      avatar: Padding(
        padding: const EdgeInsets.only(bottom: 4.0, left: 4.0),
        child: Icon(
          icon,
          color: EufemiaColors.cherryRed,
        ),
      ),
      label: Text(text),
    );
  }

  static warning({String text, IconData icon = EufemiaIcons.error_medium}) {
    return Chip(
      backgroundColor: EufemiaColors.signalYellow30,
      avatar: Padding(
        padding: const EdgeInsets.only(bottom: 4.0, left: 4.0),
        child: Icon(
          icon,
          color: EufemiaColors.signalYellow,
        ),
      ),
      label: Text(text),
    );
  }

  static info({String text, IconData icon = EufemiaIcons.information_medium}) {
    return Chip(
      backgroundColor: EufemiaColors.mintGreen,
      avatar: Padding(
        padding: const EdgeInsets.only(bottom: 4.0, left: 4.0),
        child: Icon(
          icon,
          color: EufemiaColors.seaGreen,
        ),
      ),
      label: Text(text),
    );
  }
}
