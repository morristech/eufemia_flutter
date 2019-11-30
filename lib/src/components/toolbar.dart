import 'package:eufemia/src/style/colors.dart';
import 'package:flutter/material.dart';

const double _borderWidth = 0.5;
const double _iconVerticalPadding = 10.75;
const double _iconHorizontalPadding = 16.75;
final Color _borderColor = EufemiaColors.softGray;

class Toolbar extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment alignment;

  const Toolbar({
    Key key,
    this.children,
    this.alignment = MainAxisAlignment.spaceBetween,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: _borderWidth,
            color: _borderColor,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: _iconHorizontalPadding,
          vertical: _iconVerticalPadding,
        ),
        child: Row(
          mainAxisAlignment: alignment,
          children: [
            if (children.length == 1) ...{
              Spacer(),
            },
            ...children,
          ],
        ),
      ),
    );
  }
}
