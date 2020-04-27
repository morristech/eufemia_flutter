import 'package:flutter/widgets.dart';

import 'text_style.dart';
import 'typography.dart';
import 'typography_data.dart';

enum EufemiaTextPredefinedStyle {
  none,
  caption,
  captionEmphasized,
  footnote,
  footnoteEmphasized,
  subhead,
  subheadEmphasized,
  body,
  bodyEmphasized,
  title,
  titleDemi,
  titleEmphasized,
  titleMedium,
  titleMediumEmphasized,
  titleLarge,
  button,
  buttonEmphasized,
  buttonSmall,
  buttonSmallEmhpasized,
}

extension EufemiaTextPredefinedStyleExtension on EufemiaTextPredefinedStyle {
  EufemiaTextStyle toStyle(
      {BuildContext context, EufemiaTypographyData typography}) {
    assert(context != null || typography != null);
    typography ??= EufemiaTypography.of(context);

    switch (this) {
      case EufemiaTextPredefinedStyle.caption:
        return typography.styles.caption;
      case EufemiaTextPredefinedStyle.captionEmphasized:
        return typography.styles.captionEmphasized;
      case EufemiaTextPredefinedStyle.footnote:
        return typography.styles.footnote;
      case EufemiaTextPredefinedStyle.footnoteEmphasized:
        return typography.styles.footnoteEmphasized;
      case EufemiaTextPredefinedStyle.subhead:
        return typography.styles.subhead;
      case EufemiaTextPredefinedStyle.subheadEmphasized:
        return typography.styles.subheadEmphasized;
      case EufemiaTextPredefinedStyle.body:
        return typography.styles.body;
      case EufemiaTextPredefinedStyle.bodyEmphasized:
        return typography.styles.bodyEmphasized;
      case EufemiaTextPredefinedStyle.title:
        return typography.styles.title;
      case EufemiaTextPredefinedStyle.titleDemi:
        return typography.styles.titleDemi;
      case EufemiaTextPredefinedStyle.titleEmphasized:
        return typography.styles.titleEmphasized;
      case EufemiaTextPredefinedStyle.titleMedium:
        return typography.styles.titleMedium;
      case EufemiaTextPredefinedStyle.titleMediumEmphasized:
        return typography.styles.titleMediumEmphasized;
      case EufemiaTextPredefinedStyle.titleLarge:
        return typography.styles.titleLarge;
      case EufemiaTextPredefinedStyle.button:
        return typography.styles.button;
      case EufemiaTextPredefinedStyle.buttonEmphasized:
        return typography.styles.buttonEmphasized;
      case EufemiaTextPredefinedStyle.buttonSmall:
        return typography.styles.buttonSmall;
      case EufemiaTextPredefinedStyle.buttonSmallEmhpasized:
        return typography.styles.buttonSmallEmphasized;
      default:
        return typography.styles.body;
    }
  }
}
