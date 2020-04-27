import 'package:flutter/widgets.dart';
import 'package:eufemia/eufemia.dart';
import 'package:eufemia_palette/eufemia_palette.dart';
import 'package:eufemia_spacing/eufemia_spacing.dart';
import 'package:eufemia_typography/eufemia_typography.dart';

import 'default_button.dart';
import 'default_typography.dart';
import 'eufemia_data.dart';

class Eufemia extends StatefulWidget {
  final EufemiaData data;
  final Widget child;

  const Eufemia({
    this.data,
    this.child,
  });

  static EufemiaData of(BuildContext context) {
    return EufemiaData(
      palette: EufemiaPalette.of(context),
      spacing: EufemiaSpacing.of(context),
      typography: EufemiaTypography.of(context),
      button: EufemiaButtonTheme.of(context),
    );
  }

  @override
  _EufemiaState createState() => _EufemiaState();
}

class _EufemiaState extends State<Eufemia> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    setState(() {
      // The properties of window have changed. We use them in our build
      // function, so we need setState(), but we don't cache anything locally.
    });
  }

  @override
  void didChangePlatformBrightness() {
    setState(() {
      // The platformBrightness property of window has changed. We reference
      // window in our build function, so we need to call setState(), but
      // we don't need to cache anything locally.
    });
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
      child: EufemiaPalette(
        data: widget.data?.palette,
        child: EufemiaSpacing(
          data: widget.data?.spacing,
          child: EufemiaDefaultTypography(
            data: widget.data?.typography,
            child: EufemiaDefaultButtonTheme(
              data: widget.data?.button,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
