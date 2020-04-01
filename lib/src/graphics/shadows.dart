library eufemia;

import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

final Color _cardDarkShadowColor = Colors.white.withOpacity(0.05);
final Offset _cardShadowOffset = Offset(0.0, 0.5);
const double _cardShadowSpreadRadius = 4.0;
const double _cardShadowBlurRadius = 16.0;
final Color _cardLightShadowColor = EufemiaColors.lightShadow;

List<BoxShadow> adaptiveShadows(
  BuildContext context, {
  double spreadRadius,
  double blurRadius,
  Offset offset,
}) {
  return [
    BoxShadow(
      color: context.bright ? _cardLightShadowColor : _cardDarkShadowColor,
      spreadRadius: spreadRadius ?? _cardShadowSpreadRadius,
      blurRadius: blurRadius ?? _cardShadowBlurRadius,
      offset: offset ?? _cardShadowOffset,
    ),
  ];
}
