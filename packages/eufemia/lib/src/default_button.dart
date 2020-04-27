import 'package:eufemia_components/eufemia_components.dart';
import 'package:flutter/widgets.dart';
import 'package:eufemia_palette/eufemia_palette.dart';
import 'package:eufemia_typography/eufemia_typography.dart';

class EufemiaDefaultButtonTheme extends StatelessWidget {
  final Widget child;
  final EufemiaButtonThemeData data;

  const EufemiaDefaultButtonTheme({
    Key key,
    this.data,
    @required this.child,
  }) : super(key: key);

  EufemiaButtonThemeData fallback(BuildContext context) {
    final palette = EufemiaPalette.of(context);
    final typography = EufemiaTypography.of(context);
    final buttonTextStyle = typography.styles.button;
    final fontSize = buttonTextStyle.size.toPoints(typography: typography);

    return EufemiaButtonThemeData(
      fill: palette.buttonColor,
      textStyle: buttonTextStyle.toTextStyle(context, typography: typography),
      cornerRadius: 100.0,
      borderWidth: 1.0,
      iconTheme: IconThemeData(
        opacity: 1.0,
        size: fontSize * 1.3,
        color: palette.iconColor,
      ),
      borderColor: palette.buttonColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return EufemiaButtonTheme(
      data: data ?? fallback(context),
      child: child,
    );
  }
}
