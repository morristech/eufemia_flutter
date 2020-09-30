import 'package:flutter/material.dart';

import 'spacing.dart';
import 'spacing_data.dart';

/// {@template eufemia.spacing.space}
/// Defines the different spacing constants used within the design system.
/// Often used in combination with the [EufemiaGap] or [EufemiaPadding] widgets.
/// {@tool snippet}
///
/// Eight pixel margin above and below, no horizontal margins:
///
/// ```dart
/// const EufemiaInsets(EufemiaSides.vertical, EufemiaSpace.small)
/// ```
/// {@end-tool}
/// {@tool snippet}
///
/// Eight pixel [EufemiaGap]:
///
/// ```dart
/// const EufemiaGap(EufemiaSpace.small)
/// ```
/// {@end-tool}
/// {@endtemplate}
enum EufemiaSpace {
  none,
  extraSmall,
  small,
  medium,
  large,
  extraLarge,
  extraExtraLarge,
}

extension EufemiaSpaceExtension on EufemiaSpace {
  double toPoints({BuildContext context, EufemiaSpacingData data}) {
    assert(context != null || data != null);
    final spacing = data ?? EufemiaSpacing.of(context);
    switch (this) {
      case EufemiaSpace.extraSmall:
        return spacing.extraSmall;
      case EufemiaSpace.small:
        return spacing.small;
      case EufemiaSpace.medium:
        return spacing.medium;
      case EufemiaSpace.large:
        return spacing.large;
      case EufemiaSpace.extraLarge:
        return spacing.extraLarge;
      case EufemiaSpace.extraExtraLarge:
        return spacing.extraExtraLarge;
      default:
        return 0;
    }
  }
}
