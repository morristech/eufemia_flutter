import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class Checkmark extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;

  const Checkmark({Key key, @required this.value, @required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: value ? EufemiaColors.seaGreenAlt : Colors.white,
          border: Border.all(
            color: EufemiaColors.seaGreenAlt,
            width: 1.5,
          ),
        ),
        child: value
            ? Center(
                child: Icon(
                  EufemiaIcons.checkmark,
                  color: Colors.white,
                  size: 12,
                ),
              )
            : Container(),
      ),
    );
  }
}
