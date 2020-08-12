import 'package:flutter/widgets.dart';

import 'typography.dart';
import 'typography_data.dart';

enum EufemiaFontSize {
  caption,
  footnote,
  subhead,
  body,
  title,
  titleMedium,
  titleLarge,
  button,
  buttonSmall,
}

extension EufemiaFontSizeExtensions on EufemiaFontSize {
  double toPoints({BuildContext context, EufemiaTypographyData typography}) {
    assert(context != null || typography != null);
    typography ??= EufemiaTypography.of(context);
    switch (this) {
      case EufemiaFontSize.caption:
        return typography.sizes.captionSize;
      case EufemiaFontSize.footnote:
        return typography.sizes.footnoteSize;
      case EufemiaFontSize.subhead:
        return typography.sizes.subheadSize;
      case EufemiaFontSize.body:
        return typography.sizes.bodySize;
      case EufemiaFontSize.title:
        return typography.sizes.titleSize;
      case EufemiaFontSize.titleMedium:
        return typography.sizes.titleMediumSize;
      case EufemiaFontSize.titleLarge:
        return typography.sizes.titleLargeSize;
      case EufemiaFontSize.button:
        return typography.sizes.buttonSize;
      case EufemiaFontSize.buttonSmall:
        return typography.sizes.buttonSmallSize;
      default:
        return typography.sizes.bodySize;
    }
  }
}
