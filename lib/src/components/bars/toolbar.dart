import 'package:eufemia/spacing.dart';
import 'package:flutter/widgets.dart';

import 'bar.dart';

class Toolbar extends StatelessWidget {
  final List<Widget> children;
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
