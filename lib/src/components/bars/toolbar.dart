import 'package:eufemia/spacing.dart';
import 'package:flutter/widgets.dart';

import 'bar.dart';

/// {@category Components}
/// {@subCategory Bars}
/// A toolbar from the Eufemia design system.
class Toolbar extends StatelessWidget {
  /// {@macro flutter.widgets.children}
  final List<Widget> children;

  /// {@macro flutter.rendering.MainAxisAlignment}
  final MainAxisAlignment mainAxisAlignment;

  const Toolbar({
    Key key,
    this.children,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bar(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        if (children.length == 1) ...{
          Spacer(),
        },
        ...children,
      ],
      padding: EufemiaInsets.allMedium,
    );
  }
}
