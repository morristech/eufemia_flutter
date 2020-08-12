import 'package:eufemia/typography.dart';
import 'package:flutter/widgets.dart';

import 'button.dart';
import 'style.dart';

class EufemiaVividButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final bool autofocus;
  final FocusNode focusNode;
  final EufemiaButtonSize size;

  const EufemiaVividButton({
    Key key,
    this.onTap,
    this.child,
    this.autofocus = false,
    this.focusNode,
    this.size = EufemiaButtonSize.medium,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EufemiaButton(
      child: child,
      onTap: onTap,
      style: EufemiaButtonStyle.vivid(
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
