import 'package:flutter/painting.dart';

/// {@category Components}
/// Calculates and returns the [Size] of the given [text] and its [style].
Size calculateSize(String text, TextStyle style) {
  final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr)
    ..layout(minWidth: 0, maxWidth: double.infinity);
  return textPainter.size;
}
