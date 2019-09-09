import 'package:eufemia/eufemia.dart' as eufemia;
import 'package:eufemia/src/components/buttons/eufemia_raw_button.dart';
import 'package:eufemia/src/style/borders.dart';
import 'package:eufemia/src/utils/icon_position.dart';
import 'package:eufemia/src/utils/icon_size.dart';
import 'package:flutter/material.dart';

class EufemiaSecondaryButton extends StatelessWidget {
  final String semanticsLabel;
  final String text;
  final IconData icon;
  final Position iconPosition;
  final IconSize iconSize;
  final VoidCallback onPressed;

  const EufemiaSecondaryButton({
    Key key,
    this.semanticsLabel,
    this.text,
    this.icon,
    this.iconPosition,
    this.iconSize,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticsLabel,
      child: EufemiaRawButton(
        text: text,
        icon: icon,
        iconPosition: iconPosition,
        iconSize: iconSize,
        onPressed: onPressed,
        backgroundColor: eufemia.EufemiaColors.white,
        backgroundPressedColor: eufemia.EufemiaColors.mintGreen,
        foregroundColor: eufemia.EufemiaColors.seaGreen,
        foregroundPressedColor: eufemia.EufemiaColors.seaGreen,
        border: EufemiaBorders.standard,
        pressedBorder: EufemiaBorders.invisible,
        hoverBorder: EufemiaBorders.standard,
      ),
    );
  }
}
