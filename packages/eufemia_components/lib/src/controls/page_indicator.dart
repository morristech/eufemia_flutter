import 'package:eufemia/eufemia.dart';
import 'package:flutter/widgets.dart';

/// Page indicator from the Eufemia Design System
class PageIndicator extends StatelessWidget {
  final bool selected;

  /// Page indicator from the Eufemia Design System
  ///
  /// * [selected]: Whether the indicator is selected or not
  const PageIndicator({Key key, @required this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);

    return AnimatedContainer(
      width: 8,
      height: 8,
      duration: Duration(milliseconds: 50),
      decoration: BoxDecoration(
        color: selected ? palette.toggle : Color(0x00),
        shape: BoxShape.circle,
        border: Border.all(
          width: 0.5,
          color: palette.toggle,
        ),
      ),
    );
  }
}
