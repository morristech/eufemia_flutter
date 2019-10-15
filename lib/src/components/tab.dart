import 'package:eufemia/eufemia.dart';
import 'package:eufemia/src/buttons/text_button.dart';
import 'package:flutter/material.dart';

const double _kTabHighllighterWidth = 2.0;
const int _kTabAnimationDuration = 500;
final Color _kTabHighlighterColor = EufemiaColors.seaGreenAlt;
final Color _kTabHighlighterDisabledColor = Colors.transparent;

class Tab extends StatelessWidget {
  final String label;
  final bool active;
  final Function() onSelected;

  const Tab({
    Key key,
    @required this.label,
    @required this.active,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: _kTabAnimationDuration),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color:
                active ? _kTabHighlighterColor : _kTabHighlighterDisabledColor,
            width: _kTabHighllighterWidth,
          ),
        ),
      ),
      child: Center(
        child: TextButton(
          text: label,
          size: ButtonSize.small,
          emphasized: active,
          enabled: true,
          onTap: onSelected,
        ),
      ),
    );
  }
}
