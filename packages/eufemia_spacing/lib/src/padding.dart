import 'package:flutter/widgets.dart';

import 'insets.dart';
import 'space.dart';
import 'sides.dart';

class EufemiaPadding extends StatelessWidget {
  final EufemiaInsets padding;
  final Widget child;

  const EufemiaPadding({
    Key key,
    this.child,
    this.padding = EufemiaInsets.none,
  })  : assert(padding != null),
        super(key: key);

  factory EufemiaPadding.only(
    EufemiaSpace space, {
    Key key,
    EufemiaSides sides = EufemiaSides.all,
  }) =>
      EufemiaPadding(
        key: key,
        padding: EufemiaInsets.only(space, sides),
      );

  factory EufemiaPadding.extraSmall({
    Key key,
    EufemiaSides sides = EufemiaSides.all,
  }) =>
      EufemiaPadding(
        key: key,
        padding: EufemiaInsets.only(EufemiaSpace.extraSmall, sides),
      );

  factory EufemiaPadding.small({
    Key key,
    EufemiaSides sides = EufemiaSides.all,
  }) =>
      EufemiaPadding(
        key: key,
        padding: EufemiaInsets.only(EufemiaSpace.small, sides),
      );

  factory EufemiaPadding.medium({
    Key key,
    EufemiaSides sides = EufemiaSides.all,
  }) =>
      EufemiaPadding(
        key: key,
        padding: EufemiaInsets.only(EufemiaSpace.medium, sides),
      );

  factory EufemiaPadding.large({
    Key key,
    EufemiaSides sides = EufemiaSides.all,
  }) =>
      EufemiaPadding(
        key: key,
        padding: EufemiaInsets.only(EufemiaSpace.large, sides),
      );

  factory EufemiaPadding.extraLarge({
    Key key,
    EufemiaSides sides = EufemiaSides.all,
  }) =>
      EufemiaPadding(
        key: key,
        padding: EufemiaInsets.only(EufemiaSpace.extraLarge, sides),
      );

  factory EufemiaPadding.extraExtraLarge({
    Key key,
    EufemiaSides sides = EufemiaSides.all,
  }) =>
      EufemiaPadding(
        key: key,
        padding: EufemiaInsets.only(EufemiaSpace.extraExtraLarge, sides),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding.toEdgeInsets(context: context),
      child: child,
    );
  }
}
