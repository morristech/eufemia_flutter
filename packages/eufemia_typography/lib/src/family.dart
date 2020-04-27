import 'package:flutter/widgets.dart';

import 'typography.dart';
import 'typography_data.dart';

enum EufemiaFontFamily {
  primary,
  monospace,
}

extension EufemiaFontFamilyExtensions on EufemiaFontFamily {
  String toFontFamily(
      {BuildContext context, EufemiaTypographyData typography}) {
    assert(context != null || typography != null);
    typography ??= EufemiaTypography.of(context);
    switch (this) {
      case EufemiaFontFamily.primary:
        return typography.families.primary;
      case EufemiaFontFamily.monospace:
        return typography.families.monospace;
      default:
        return typography.families.primary;
    }
  }
}
