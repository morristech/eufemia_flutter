import 'package:eufemia/eufemia.dart';
import 'package:eufemia/src/style/colors.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

const double _borderRadius = 2.0;
final Color _backgroundColor = EufemiaColors.coal;

class Snacks {
  static Flushbar bar({
    String title,
    @required String message,
    Widget icon,
    VoidCallback onTap,
    EdgeInsets margin,
    EdgeInsets padding,
    Duration duration,
    Widget button,
    TextStyle messageStyle,
    TextStyle titleStyle,
    bool showSpinner = false,
  }) {
    if (button is TextButton) {
      button = (button as TextButton).copyWith(
        color: EufemiaColors.mintGreen,
        tappedColor: EufemiaColors.mintGreen.withOpacity(0.5),
        emphasized: true,
        size: ButtonSize.small,
      );
    }

    return Flushbar(
      icon: showSpinner ? Spinner() : icon,
      duration: duration ?? Duration(milliseconds: 2000),
      margin: margin ?? EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      borderRadius: _borderRadius,
      backgroundColor: _backgroundColor,
      title: title,
      message: message,
      messageStyle: messageStyle ?? Eufemia.subhead.copyWith(color: Colors.white),
      onTap: (_) => onTap,
      button: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: button,
      ),
    );
  }
}
