import 'package:flutter/widgets.dart';

import 'typography.dart';
import 'typography_data.dart';

/// {@category Typography}
/// A family of the DNB font.
enum EufemiaFontFamily {
  primary,
  monospace,
}

/// {@category Typography}
/// {@template eufemia.extension}
/// An extension that converts internal values from Eufemia to Flutter-friendly
/// values.
/// {@endtemplate}
extension EufemiaFontFamilyExtensions on EufemiaFontFamily {
  /// {@category Typography}
  /// Returns the font family used by the given [typography] or [context].
  /// Only one of these should be set.
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
