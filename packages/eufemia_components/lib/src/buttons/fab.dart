import 'package:eufemia_palette/eufemia_palette.dart';
import 'package:eufemia_typography/eufemia_typography.dart';
import 'package:flutter/widgets.dart';

import 'button.dart';
import 'style.dart';

class EufemiaFloatingActionButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final bool autofocus;
  final FocusNode focusNode;
  final EufemiaButtonSize size;

  const EufemiaFloatingActionButton({
    Key key,
    this.onTap,
    this.child,
    this.autofocus = false,
    this.focusNode,
    this.size = EufemiaButtonSize.medium,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);

    return EufemiaButton(
      child: child,
      onTap: onTap,
      style: EufemiaButtonStyle.fab(
        backgroundColor: palette.button,
        foregroundColor: palette.onButton,
        textStyle: getStyle(context, size),
        iconTheme: getIconTheme(context, size),
        context: context,
      ),
      focusNode: focusNode,
      autofocus: autofocus,
    );
  }

  IconThemeData getIconTheme(BuildContext context, EufemiaButtonSize size) {
    switch (size) {
      case EufemiaButtonSize.small:
        return IconThemeData(
          size: 16.0,
        );
      default:
        return IconThemeData(
          size: 24.0,
        );
    }
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
