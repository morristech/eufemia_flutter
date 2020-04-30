import 'package:eufemia_palette/eufemia_palette.dart';
import 'package:eufemia_typography/eufemia_typography.dart';
import 'package:flutter/widgets.dart';

import 'button.dart';
import 'style.dart';

class TextButton extends StatelessWidget {
  final Widget child;
  final bool emphasized;
  final VoidCallback onTap;
  final bool autofocus;
  final FocusNode focusNode;
  final EufemiaButtonSize size;

  const TextButton({
    Key key,
    this.onTap,
    this.child,
    this.autofocus = false,
    this.focusNode,
    this.emphasized = false,
    this.size = EufemiaButtonSize.medium,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);

    return EufemiaButton(
      child: child,
      onTap: onTap,
      style: EufemiaButtonStyle.text(
        backgroundColor: palette.toggleInactive,
        foregroundColor: palette.button,
        textStyle: getStyle(context, size, emphasized),
        context: context,
        size: size,
      ),
      focusNode: focusNode,
      autofocus: autofocus,
    );
  }

  TextStyle getStyle(
    BuildContext context,
    EufemiaButtonSize size,
    bool emhpasized,
  ) {
    final typography = EufemiaTypography.of(context);

    switch (size) {
      case EufemiaButtonSize.small:
        if (emhpasized) {
          return typography.styles.buttonSmallEmphasized.toTextStyle(context);
        }
        return typography.styles.buttonSmall.toTextStyle(context);
      default:
        if (emphasized) {
          return typography.styles.buttonEmphasized.toTextStyle(context);
        }
        return typography.styles.button.toTextStyle(context);
    }
  }
}
