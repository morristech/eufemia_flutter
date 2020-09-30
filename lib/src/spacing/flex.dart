import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'children_extensions.dart';
import 'insets.dart';
import 'padding.dart';
import 'space.dart';

class EufemiaFlex extends StatelessWidget {
  final Axis direction;

  /// {@macro eufemia.spacing.insets}
  final EufemiaInsets padding;
  final EufemiaSpace spaceBetween;
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final VerticalDirection verticalDirection;
  final TextDirection textDirection;
  final TextBaseline textBaseline;

  const EufemiaFlex({
    Key key,
    @required this.direction,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.padding,
    this.spaceBetween,
    this.children = const <Widget>[],
  })  : assert(direction != null),
        assert(mainAxisAlignment != null),
        assert(mainAxisSize != null),
        assert(crossAxisAlignment != null),
        assert(verticalDirection != null),
        assert(crossAxisAlignment != CrossAxisAlignment.baseline ||
            textBaseline != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget result = Flex(
      direction: direction,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      mainAxisAlignment: mainAxisAlignment,
      textBaseline: textBaseline,
      children: spaceBetween != null && spaceBetween != EufemiaSpace.none
          ? children.spaced(spaceBetween)
          : children,
    );

    if (padding != null) {
      result = EufemiaPadding(
        padding: padding,
        child: result,
      );
    }

    return Provider.value(
      value: direction,
      child: result,
    );
  }
}

class EufemiaColumn extends EufemiaFlex {
  const EufemiaColumn({
    Key key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline textBaseline,
    EufemiaInsets padding,
    EufemiaSpace spaceBetween,
    List<Widget> children = const <Widget>[],
  }) : super(
          children: children,
          key: key,
          padding: padding,
          spaceBetween: spaceBetween,
          direction: Axis.vertical,
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          textBaseline: textBaseline,
        );
}

class EufemiaRow extends EufemiaFlex {
  const EufemiaRow({
    Key key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline textBaseline,
    EufemiaInsets padding,
    EufemiaSpace spaceBetween,
    List<Widget> children = const <Widget>[],
  }) : super(
          children: children,
          key: key,
          padding: padding,
          spaceBetween: spaceBetween,
          direction: Axis.horizontal,
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          textBaseline: textBaseline,
        );
}
