import 'package:eufemia/eufemia.dart';
import 'package:eufemia/src/buttons/text_button.dart';
import 'package:flutter/material.dart';

const double _tabHighllighterWidth = 2.0;
const int _tabAnimationDuration = 500;
final Color _tabHighlighterColor = EufemiaColors.seaGreenAlt;
final Color _tabHighlighterDisabledColor = Colors.transparent;

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
      duration: Duration(milliseconds: _tabAnimationDuration),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: active ? _tabHighlighterColor : _tabHighlighterDisabledColor,
            width: _tabHighllighterWidth,
          ),
        ),
      ),
      child: Center(
        child: TextButton(
          label: label,
          size: ButtonSize.small,
          emphasized: active,
          enabled: true,
          onPressed: onSelected,
        ),
      ),
    );
  }
}
