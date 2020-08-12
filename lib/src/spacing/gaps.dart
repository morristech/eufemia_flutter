import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'space.dart';
import 'spacing.dart';

class EufemiaGap extends StatelessWidget {
  final EufemiaSpace vertical;
  final EufemiaSpace horizontal;
  final EufemiaSpace space;

  const EufemiaGap(
    this.space, {
    Key key,
  })  : vertical = null,
        horizontal = null,
        super(key: key);

  const EufemiaGap.extraSmall({
    Key key,
  })  : space = EufemiaSpace.extraSmall,
        vertical = null,
        horizontal = null,
        super(key: key);

  const EufemiaGap.small({
    Key key,
  })  : space = EufemiaSpace.small,
        vertical = null,
        horizontal = null,
        super(key: key);

  const EufemiaGap.large({
    Key key,
  })  : space = EufemiaSpace.large,
        vertical = null,
        horizontal = null,
        super(key: key);

  const EufemiaGap.medium({
    Key key,
  })  : space = EufemiaSpace.medium,
        vertical = null,
        horizontal = null,
        super(key: key);

  const EufemiaGap.extraLarge({
    Key key,
  })  : space = EufemiaSpace.extraLarge,
        vertical = null,
        horizontal = null,
        super(key: key);

  const EufemiaGap.extraExtraLarge({
    Key key,
  })  : space = EufemiaSpace.extraExtraLarge,
        vertical = null,
        horizontal = null,
        super(key: key);

  const EufemiaGap.horizontal({
    Key key,
    this.horizontal = EufemiaSpace.medium,
  })  : assert(horizontal != null),
        vertical = EufemiaSpace.none,
        space = null,
        super(key: key);

  const EufemiaGap.vertical({
    Key key,
    this.vertical = EufemiaSpace.medium,
  })  : assert(vertical != null),
        horizontal = EufemiaSpace.none,
        space = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final spacing = EufemiaSpacing.of(context);
    var horizontal = this.horizontal;
    var vertical = this.vertical;
    if (horizontal == null && vertical == null) {
      final axis = Provider.of<Axis>(context);
      if (axis == Axis.horizontal) {
        horizontal = space;
      } else {
        vertical = space;
      }
    }
    return SizedBox(
      width: horizontal?.toPoints(data: spacing) ?? 0.0,
      height: vertical?.toPoints(data: spacing) ?? 0.0,
    );
  }
}
