import 'package:flutter/widgets.dart';

import 'typography.dart';
import 'typography_data.dart';

enum EufemiaFontWeight {
  normal,
  demi,
  emphasized,
}

extension EufemiaFontWeightExtensions on EufemiaFontWeight {
  FontWeight toFontWeight(
      {BuildContext context, EufemiaTypographyData typography}) {
    assert(context != null || typography != null);
    typography ??= EufemiaTypography.of(context);
    switch (this) {
      case EufemiaFontWeight.normal:
        return typography.weights.normal;
      case EufemiaFontWeight.demi:
        return typography.weights.demi;
      case EufemiaFontWeight.emphasized:
        return typography.weights.emphasized;
      default:
        return typography.weights.normal;
    }
  }
}
