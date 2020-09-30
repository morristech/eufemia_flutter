import 'package:eufemia/palette.dart';
import 'package:eufemia/typography.dart';
import 'package:flutter/widgets.dart';

import 'button.dart';
import 'style.dart';

/// {@category Components}
/// {@subCategory Buttons}
/// A text button from the Eufemia design system.
class EufemiaTextButton extends StatelessWidget {
  /// If the text should be emphasized (bold font)
  final bool emphasized;

  /// {@macro eufemia.components.EufemiaButton.child}
  final Widget child;

  /// {@macro eufemia.gestures.onTap}
  final GestureTapCallback onTap;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode focusNode;

  /// {@macro eufemia.components.EufemiaButtonSize}
  final EufemiaButtonSize size;

  const EufemiaTextButton({
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
