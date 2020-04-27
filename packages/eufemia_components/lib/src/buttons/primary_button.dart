import 'package:eufemia_palette/eufemia_palette.dart';
import 'package:flutter/widgets.dart';

import 'button.dart';
import 'style.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final bool autofocus;
  final FocusNode focusNode;

  const PrimaryButton({
    Key key,
    this.onTap,
    this.child,
    this.autofocus = false,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);

    return EufemiaButton(
      child: child,
      onTap: onTap,
      style: EufemiaButtonStyle.primary(
        backgroundColor: palette.buttonColor,
        foregroundColor: palette.buttonText,
      ),
      focusNode: focusNode,
      autofocus: autofocus,
    );
  }
}
