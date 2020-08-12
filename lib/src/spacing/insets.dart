import 'package:flutter/material.dart';

import 'space.dart';
import 'sides.dart';
import 'spacing.dart';
import 'spacing_data.dart';

class EufemiaInsets {
  final EufemiaSpace top;
  final EufemiaSpace bottom;
  final EufemiaSpace left;
  final EufemiaSpace right;

  static const EufemiaInsets none = EufemiaInsets(all: EufemiaSpace.none);
  static const EufemiaInsets allExtraSmall =
      EufemiaInsets(all: EufemiaSpace.extraSmall);
  static const EufemiaInsets allSmall = EufemiaInsets(all: EufemiaSpace.small);
  static const EufemiaInsets allMedium =
      EufemiaInsets(all: EufemiaSpace.medium);
  static const EufemiaInsets allLarge = EufemiaInsets(all: EufemiaSpace.large);
  static const EufemiaInsets allExtraLarge =
      EufemiaInsets(all: EufemiaSpace.extraLarge);
  static const EufemiaInsets allExtraExtraLarge =
      EufemiaInsets(all: EufemiaSpace.extraExtraLarge);

  const EufemiaInsets({
    EufemiaSpace top,
    EufemiaSpace bottom,
    EufemiaSpace left,
    EufemiaSpace right,
    EufemiaSpace vertical,
    EufemiaSpace horizontal,
    EufemiaSpace all,
  })  : top = top ?? (vertical ?? (all ?? EufemiaSpace.none)),
        bottom = bottom ?? (vertical ?? (all ?? EufemiaSpace.none)),
        left = left ?? (horizontal ?? (all ?? EufemiaSpace.none)),
        right = right ?? (horizontal ?? (all ?? EufemiaSpace.none));

  factory EufemiaInsets.only(EufemiaSpace space,
          [EufemiaSides sides = EufemiaSides.all]) =>
      EufemiaInsets(
        top: sides.hasTop ? space : EufemiaSpace.none,
        bottom: sides.hasBottom ? space : EufemiaSpace.none,
        right: sides.hasRight ? space : EufemiaSpace.none,
        left: sides.hasLeft ? space : EufemiaSpace.none,
      );

  factory EufemiaInsets.extraSmall([EufemiaSides sides = EufemiaSides.all]) =>
      EufemiaInsets.only(EufemiaSpace.extraSmall, sides);

  factory EufemiaInsets.small([EufemiaSides sides = EufemiaSides.all]) =>
      EufemiaInsets.only(EufemiaSpace.small, sides);

  factory EufemiaInsets.medium([EufemiaSides sides = EufemiaSides.all]) =>
      EufemiaInsets.only(
        EufemiaSpace.medium,
        sides,
      );

  factory EufemiaInsets.large([EufemiaSides sides = EufemiaSides.all]) =>
      EufemiaInsets.only(
        EufemiaSpace.large,
        sides,
      );

  factory EufemiaInsets.extraLarge([EufemiaSides sides = EufemiaSides.all]) =>
      EufemiaInsets.only(
        EufemiaSpace.extraLarge,
        sides,
      );

  factory EufemiaInsets.extraExtraLarge(
          [EufemiaSides sides = EufemiaSides.all]) =>
      EufemiaInsets.only(
        EufemiaSpace.extraExtraLarge,
        sides,
      );

  EdgeInsets toEdgeInsets({BuildContext context, EufemiaSpacingData data}) {
    assert(context != null || data != null);
    final spacing = data ?? EufemiaSpacing.of(context);
    return EdgeInsets.only(
      left: left.toPoints(data: spacing),
      right: right.toPoints(data: spacing),
      top: top.toPoints(data: spacing),
      bottom: bottom.toPoints(data: spacing),
    );
  }
}
