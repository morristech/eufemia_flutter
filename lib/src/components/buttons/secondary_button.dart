import 'package:eufemia/palette.dart';
import 'package:eufemia/typography.dart';
import 'package:flutter/widgets.dart';

import 'button.dart';
import 'style.dart';

class EufemiaSecondaryButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final bool autofocus;
  final FocusNode focusNode;
  final EufemiaButtonSize size;
  final String semanticsLabel;

  const EufemiaSecondaryButton({
    Key key,
    this.onTap,
    this.child,
    this.autofocus = false,
    this.focusNode,
    this.size = EufemiaButtonSize.medium,
    this.semanticsLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);

    return EufemiaButton(
      semanticsLabel: semanticsLabel,
      child: child,
      onTap: onTap,
      style: EufemiaButtonStyle.secondary(
        backgroundColor: palette.toggleInactive,
        borderColor: palette.button,
        foregroundColor: palette.button,
        textStyle: getStyle(context, size),
        context: context,
        size: size,
      ),
      focusNode: focusNode,
      autofocus: autofocus,
    );
  }

  TextStyle getStyle(BuildContext context, EufemiaButtonSize size) {
    final typography = EufemiaTypography.of(context);

    switch (size) {
      case EufemiaButtonSize.small:
        return typography.styles.buttonSmall.toTextStyle(context);
      default:
        return typography.styles.button.toTextStyle(context);
    }
  }
}
