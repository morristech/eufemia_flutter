import 'package:eufemia/components.dart';
import 'package:eufemia/palette.dart';
import 'package:flutter/widgets.dart';

class Checkmark extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;

  const Checkmark({
    Key key,
    @required this.value,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);

    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 50),
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: value ? palette.toggle : palette.toggleInactive,
          border: Border.all(
            color: palette.toggle,
            width: 1.5,
          ),
        ),
        child: Center(
          child: value
              ? Icon(
                  EufemiaIcons.checkmark,
                  color: palette.onToggle,
                  size: 12,
                )
              : null,
        ),
      ),
    );
  }
}
