import 'package:eufemia_palette/eufemia_palette.dart';
import 'package:flutter/widgets.dart';

List<BoxShadow> adaptiveShadows(
  BuildContext context, {
  double spreadRadius,
  double blurRadius,
  Offset offset,
}) {
  final palette = EufemiaPalette.of(context);
  spreadRadius ??= 8.0;
  blurRadius ??= 16.0;
  offset ??= Offset(0, .5);

  return [
    BoxShadow(
      color: palette.shadow,
      spreadRadius: spreadRadius,
      blurRadius: blurRadius,
      offset: offset,
    ),
  ];
}
