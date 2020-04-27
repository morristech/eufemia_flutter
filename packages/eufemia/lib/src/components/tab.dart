import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _tabHighllighterWidth = 2.0;
const int _tabAnimationDuration = 500;
final Color _tabHighlighterDisabledColor = Colors.transparent;

class EufemiaTab extends StatelessWidget {
  final String label;
  final bool active;
  final Function() onSelected;

  const EufemiaTab({
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
            color: active
                ? context.bright
                    ? EufemiaColors.seaGreenAlt
                    : EufemiaColors.mintGreen
                : _tabHighlighterDisabledColor,
            width: _tabHighllighterWidth,
          ),
        ),
      ),
      child: Center(
        child: TextButton(
          child: Text(label),
          size: EufemiaButtonSize.small,
          emphasized: active,
          onTap: onSelected,
        ),
      ),
    );
  }
}
