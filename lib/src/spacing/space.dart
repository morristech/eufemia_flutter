import 'package:flutter/material.dart';

import 'spacing.dart';
import 'spacing_data.dart';

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
