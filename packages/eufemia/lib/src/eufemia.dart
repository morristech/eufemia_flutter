import 'package:flutter/widgets.dart';
import 'package:eufemia/eufemia.dart';
import 'package:eufemia_palette/eufemia_palette.dart';
import 'package:eufemia_spacing/eufemia_spacing.dart';
import 'package:eufemia_typography/eufemia_typography.dart';

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
    return EufemiaPalette(
      data: data?.palette,
      child: EufemiaSpacing(
        data: data?.spacing,
        child: EufemiaDefaultTypography(
          data: data?.typography,
          child: EufemiaDefaultButtonTheme(
            data: data?.button,
            child: child,
          ),
        ),
      ),
    );
  }
}
