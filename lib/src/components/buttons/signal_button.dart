import 'package:eufemia/eufemia.dart' as eufemia;
import 'package:eufemia/src/components/buttons/eufemia_raw_button.dart';
import 'package:eufemia/src/style/borders.dart';
import 'package:eufemia/src/utils/button_size.dart';
import 'package:eufemia/src/utils/icon_size.dart';
import 'package:flutter/material.dart';

class EufemiaSignalButton extends StatelessWidget {
  final String semanticsLabel;
  final String text;
  final IconData icon;
  final IconSize iconSize;
  final VoidCallback onPressed;
  final ButtonSize size;

  const EufemiaSignalButton({
    Key key,
    this.semanticsLabel,
    this.text,
    this.icon,
    this.iconSize,
    this.onPressed,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticsLabel,
      value: text,
      child: EufemiaRawButton(
        text: text,
        iconSize: iconSize ?? IconSize.medium,
        icon: icon,
        backgroundColor: eufemia.EufemiaColors.signalYellow,
        foregroundColor: eufemia.EufemiaColors.black,
        hoverBorder: EufemiaBorders.standard,
        onPressed: onPressed,
        size: size,
      ),
    );
  }
}
