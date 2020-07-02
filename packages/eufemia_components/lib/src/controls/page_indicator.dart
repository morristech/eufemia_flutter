import 'package:eufemia_palette/eufemia_palette.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// Page indicator from the Eufemia Design System
class PageIndicator extends StatelessWidget {
  final PageController controller;
  final int count;

  /// Page indicator from the Eufemia Design System
  ///
  /// * [selected]: Whether the indicator is selected or not
  const PageIndicator({Key key, this.controller, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);

    return SmoothPageIndicator(
      controller: controller,
      count: count,
      effect: WormEffect(
        dotColor: palette.toggle.withOpacity(0.5),
        activeDotColor: palette.toggle,
        dotHeight: 8.0,
        dotWidth: 8.0,
      ),
    );
  }
}
