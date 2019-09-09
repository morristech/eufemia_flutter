import 'package:eufemia/eufemia.dart';
import 'package:eufemia/src/components/buttons/icon_button.dart';
import 'package:eufemia/src/components/buttons/primary_button.dart';
import 'package:eufemia/src/components/buttons/secondary_button.dart';
import 'package:eufemia/src/components/buttons/tertiary_button.dart';
import 'package:eufemia/src/utils/button_size.dart';
import 'package:eufemia/src/utils/icon_position.dart';
import 'package:eufemia/src/utils/icon_size.dart';
import 'package:flutter/material.dart';

enum Variant { primary, secondary, tertiary, signal, icon }

class EufemiaButton extends StatelessWidget {
  final Variant variant;
  final VoidCallback onPressed;
  final String semanticsLabel;
  final String text;
  final IconSize iconSize;
  final ButtonSize buttonSize;
  final Position iconPosition;
  final IconData icon;

  const EufemiaButton({
    Key key,
    this.variant = Variant.primary,
    this.onPressed,
    this.semanticsLabel,
    this.text,
    this.iconSize = IconSize.small,
    this.buttonSize,
    this.icon,
    this.iconPosition = Position.right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (text == null) {
      return EufemiaIconButton(
        icon: icon,
        size: buttonSize,
        onPressed: onPressed,
      );
    }
    switch (variant) {
      case Variant.primary:
        return EufemiaPrimaryButton(
          text: text,
          onPressed: onPressed,
          icon: icon,
          iconSize: iconSize,
          iconPosition: iconPosition,
        );
      case Variant.secondary:
        return EufemiaSecondaryButton(
          text: text,
          onPressed: onPressed,
          icon: icon,
          iconSize: iconSize,
          iconPosition: iconPosition,
        );
      case Variant.tertiary:
        return EufemiaTertiaryButton(
          text: text,
          onPressed: onPressed,
          icon: icon,
          iconSize: iconSize,
          iconPosition: iconPosition,
        );
      case Variant.signal:
        return EufemiaSignalButton(
          text: text,
          onPressed: onPressed,
          icon: icon,
          iconSize: iconSize,
          size: buttonSize,
        );
      case Variant.icon:
        return EufemiaIconButton(
          icon: icon,
          size: buttonSize,
          onPressed: onPressed,
        );
      // Never reaches this point
      default:
        return null;
    }
  }
}
