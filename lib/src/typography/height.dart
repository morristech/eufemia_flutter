import 'package:flutter/widgets.dart';

import 'typography.dart';
import 'typography_data.dart';

/// {@category Typography}
/// A specific type of line height for a certain style.
enum EufemiaLineHeight {
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

/// {@category Typography}
/// {@macro eufemia.extension}
extension EufemiaLineHeightExtensions on EufemiaLineHeight {
  /// {@category Typography}
  /// Returns the [EufemiaLineHeight] as the line height in numeric points.
  double toPoints({BuildContext context, EufemiaTypographyData typography}) {
    assert(context != null || typography != null);
    typography ??= EufemiaTypography.of(context);
    switch (this) {
      case EufemiaLineHeight.caption:
        return typography.heights.captionHeight;
      case EufemiaLineHeight.footnote:
        return typography.heights.footnoteHeight;
      case EufemiaLineHeight.subhead:
        return typography.heights.subheadHeight;
      case EufemiaLineHeight.body:
        return typography.heights.bodyHeight;
      case EufemiaLineHeight.title:
        return typography.heights.titleHeight;
      case EufemiaLineHeight.titleMedium:
        return typography.heights.titleMediumHeight;
      case EufemiaLineHeight.titleLarge:
        return typography.heights.titleLargeHeight;
      case EufemiaLineHeight.button:
        return typography.heights.buttonHeight;
      case EufemiaLineHeight.buttonSmall:
        return typography.heights.buttonSmallHeight;
      default:
        return typography.heights.bodyHeight;
    }
  }
}
