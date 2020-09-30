import 'package:flutter/widgets.dart';

import 'insets.dart';
import 'space.dart';
import 'sides.dart';

class EufemiaPadding extends StatelessWidget {
  /// {@macro eufemia.spacing.insets}
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
    Widget child,
  }) =>
      EufemiaPadding(
        key: key,
        padding: EufemiaInsets.only(space, sides),
        child: child,
      );

  factory EufemiaPadding.extraSmall({
    Key key,
    EufemiaSides sides = EufemiaSides.all,
    Widget child,
  }) =>
      EufemiaPadding(
        key: key,
        padding: EufemiaInsets.only(EufemiaSpace.extraSmall, sides),
        child: child,
      );

  factory EufemiaPadding.small({
    Key key,
    EufemiaSides sides = EufemiaSides.all,
    Widget child,
  }) =>
      EufemiaPadding(
        key: key,
        padding: EufemiaInsets.only(EufemiaSpace.small, sides),
        child: child,
      );

  factory EufemiaPadding.medium({
    Key key,
    EufemiaSides sides = EufemiaSides.all,
    Widget child,
  }) =>
      EufemiaPadding(
        key: key,
        padding: EufemiaInsets.only(EufemiaSpace.medium, sides),
        child: child,
      );

  factory EufemiaPadding.large({
    Key key,
    EufemiaSides sides = EufemiaSides.all,
    Widget child,
  }) =>
      EufemiaPadding(
        key: key,
        padding: EufemiaInsets.only(EufemiaSpace.large, sides),
        child: child,
      );

  factory EufemiaPadding.extraLarge({
    Key key,
    EufemiaSides sides = EufemiaSides.all,
    Widget child,
  }) =>
      EufemiaPadding(
        key: key,
        padding: EufemiaInsets.only(EufemiaSpace.extraLarge, sides),
        child: child,
      );

  factory EufemiaPadding.extraExtraLarge({
    Key key,
    EufemiaSides sides = EufemiaSides.all,
    Widget child,
  }) =>
      EufemiaPadding(
        key: key,
        padding: EufemiaInsets.only(EufemiaSpace.extraExtraLarge, sides),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding.toEdgeInsets(context: context),
      child: child,
    );
  }
}
