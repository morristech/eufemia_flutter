import 'package:eufemia/src/style/colors.dart';
import 'package:flutter/material.dart';

const double _kBorderWidth = 0.5;
const double _kIconVerticalPadding = 10.75;
const double _kIconHorizontalPadding = 16.75;
final Color _kBorderColor = EufemiaColors.softGray;
final Color _kIconColor = EufemiaColors.seaGreenAlt;

class Toolbar extends StatelessWidget {
  final List<Widget> children;

  const Toolbar({Key key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: _kBorderWidth,
            color: _kBorderColor,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: _kIconHorizontalPadding,
          vertical: _kIconVerticalPadding,
        ),
        child: IconTheme(
          data: IconThemeData(
            color: _kIconColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (children.length == 1) ...{
                Spacer(),
              },
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}
