import 'package:flutter/widgets.dart';
import 'gaps.dart';
import 'space.dart';

extension WidgetIterableExtension on Iterable<Widget> {
  List<Widget> spaced(EufemiaSpace space) {
    if (isEmpty) {
      return const <Widget>[];
    }
    return <Widget>[
      first,
      ...skip(1).expand((child) {
        return <Widget>[
          EufemiaGap(space),
          child,
        ];
      }),
    ];
  }
}
