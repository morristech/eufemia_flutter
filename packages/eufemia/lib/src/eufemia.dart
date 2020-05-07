import 'package:flutter/widgets.dart';
import 'package:eufemia/eufemia.dart';
import 'package:eufemia_palette/eufemia_palette.dart';
import 'package:eufemia_spacing/eufemia_spacing.dart';
import 'package:eufemia_typography/eufemia_typography.dart';
import 'package:eufemia_components/eufemia_components.dart';

import 'default_button.dart';
import 'default_typography.dart';
import 'eufemia_data.dart';

class Eufemia extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return _MediaQueryFromWindow(
      child: Builder(
        builder: (context) {
          return EufemiaPalette(
            data: context.platformBright ? data.palette : data.darkPalette,
            child: EufemiaSpacing(
              data: data.spacing,
              child: EufemiaDefaultTypography(
                data: data.typography,
                child: EufemiaDefaultButtonTheme(
                  data: data.button,
                  child: child,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MediaQueryFromWindow extends StatefulWidget {
  final Widget child;

  const _MediaQueryFromWindow({Key key, this.child}) : super(key: key);

  @override
  _MediaQueryFromWindowState createState() => _MediaQueryFromWindowState();
}

class _MediaQueryFromWindowState extends State<_MediaQueryFromWindow>
    with WidgetsBindingObserver {
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
      child: widget.child,
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
