import 'package:flutter/widgets.dart';

import 'text_style.dart';
import 'typography.dart';

class EufemiaText extends StatelessWidget {
  final EufemiaTextStyle style;
  final String data;

  const EufemiaText(this.data, {Key key, this.style})
      : assert(data != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context);
    final typography = EufemiaTypography.of(context);

    var style = this.style?.loadPredefined(context, typography: typography) ??
        EufemiaTextStyle();

    final textDirection =
        (this.style?.textDirection ?? style.textDirection) ?? TextDirection.ltr;
    final textAlign = (this.style?.textAlign ?? style.textAlign) ??
        defaultTextStyle.textAlign;
    final builder = (this.style?.builder ?? style.builder);
    final textStyle = this.style.toTextStyle(context, typography: typography);

    Widget result = Text(
      data,
      textAlign: textAlign,
      textDirection: textDirection,
      style: textStyle,
    );

    if (builder != null) {
      result = builder(context, result);
    }

    return result;
  }
}
