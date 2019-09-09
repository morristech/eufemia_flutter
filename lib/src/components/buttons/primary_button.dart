import 'package:eufemia/eufemia.dart' as eufemia;
import 'package:eufemia/src/components/buttons/eufemia_raw_button.dart';
import 'package:eufemia/src/style/borders.dart';
import 'package:eufemia/src/utils/icon_position.dart';
import 'package:eufemia/src/utils/icon_size.dart';
import 'package:flutter/material.dart';

class EufemiaPrimaryButton extends StatelessWidget {
  final String semanticsLabel;
  final String text;
  final VoidCallback onPressed;
  final IconData icon;
  final Position iconPosition;
  final IconSize iconSize;

  const EufemiaPrimaryButton({
    Key key,
    this.semanticsLabel,
    this.text,
    this.onPressed,
    this.icon,
    this.iconPosition,
    this.iconSize = IconSize.small,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticsLabel,
      child: EufemiaRawButton(
        text: text,
        backgroundColor: eufemia.EufemiaColors.seaGreen,
        backgroundHoverColor: eufemia.EufemiaColors.white,
        backgroundPressedColor: eufemia.EufemiaColors.mintGreen,
        hoverBorder: EufemiaBorders.standard,
        onPressed: onPressed,
        iconPosition: iconPosition,
        iconSize: iconSize,
        icon: icon,
      ),
    );
  }
}
