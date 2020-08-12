import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'predefined_style.dart';
import 'typography.dart';
import 'typography_data.dart';
import 'size.dart';
import 'height.dart';
import 'weight.dart';
import 'family.dart';

part 'text_style.freezed.dart';

typedef EufemiaTextStyleWidgetBuilder = Widget Function(
    BuildContext context, Widget child);

@freezed
abstract class EufemiaTextStyle with _$EufemiaTextStyle {
  const factory EufemiaTextStyle({
    @nullable Color color,
    @nullable TextAlign textAlign,
    @nullable TextDirection textDirection,
    @nullable TextDecorationStyle textDecorationStyle,
    @nullable double textDecorationThickness,
    @nullable Color textDecorationColor,
    @nullable EufemiaTextPredefinedStyle predefinedStyle,
    @nullable TextDecoration textDecoration,
    @nullable double letterSpacing,
    @nullable EufemiaFontSize size,
    @nullable EufemiaFontWeight weight,
    @nullable EufemiaFontFamily family,
    @nullable EufemiaLineHeight height,
    @nullable EufemiaTextStyleWidgetBuilder builder,
  }) = _EufemiaTextStyle;

  factory EufemiaTextStyle.caption({
    Color color,
    EufemiaFontSize size = EufemiaFontSize.caption,
    EufemiaLineHeight height = EufemiaLineHeight.caption,
    EufemiaFontWeight weight = EufemiaFontWeight.normal,
  }) =>
      EufemiaTextStyle(
        color: color,
        predefinedStyle: EufemiaTextPredefinedStyle.caption,
        size: size,
        height: height,
        weight: weight,
      );

  factory EufemiaTextStyle.captionEmphasized({
    Color color,
    EufemiaFontSize size = EufemiaFontSize.caption,
    EufemiaLineHeight height = EufemiaLineHeight.caption,
    EufemiaFontWeight weight = EufemiaFontWeight.emphasized,
  }) =>
      EufemiaTextStyle(
        color: color,
        predefinedStyle: EufemiaTextPredefinedStyle.captionEmphasized,
        size: size,
        height: height,
        weight: weight,
      );

  factory EufemiaTextStyle.footnote({
    Color color,
    EufemiaFontSize size = EufemiaFontSize.footnote,
    EufemiaLineHeight height = EufemiaLineHeight.footnote,
    EufemiaFontWeight weight = EufemiaFontWeight.normal,
  }) =>
      EufemiaTextStyle(
        color: color,
        predefinedStyle: EufemiaTextPredefinedStyle.footnote,
        size: size,
        height: height,
        weight: weight,
      );

  factory EufemiaTextStyle.footnoteEmphasized({
    Color color,
    EufemiaFontSize size = EufemiaFontSize.footnote,
    EufemiaLineHeight height = EufemiaLineHeight.footnote,
    EufemiaFontWeight weight = EufemiaFontWeight.emphasized,
  }) =>
      EufemiaTextStyle(
        color: color,
        predefinedStyle: EufemiaTextPredefinedStyle.footnoteEmphasized,
        size: size,
        height: height,
        weight: weight,
      );

  factory EufemiaTextStyle.subhead({
    Color color,
    EufemiaFontSize size = EufemiaFontSize.subhead,
    EufemiaLineHeight height = EufemiaLineHeight.caption,
    EufemiaFontWeight weight = EufemiaFontWeight.normal,
  }) =>
      EufemiaTextStyle(
        color: color,
        predefinedStyle: EufemiaTextPredefinedStyle.subhead,
        size: size,
        height: height,
        weight: weight,
      );

  factory EufemiaTextStyle.subheadEmphasized({
    Color color,
    EufemiaFontSize size = EufemiaFontSize.subhead,
    EufemiaLineHeight height = EufemiaLineHeight.subhead,
    EufemiaFontWeight weight = EufemiaFontWeight.emphasized,
  }) =>
      EufemiaTextStyle(
        color: color,
        predefinedStyle: EufemiaTextPredefinedStyle.subheadEmphasized,
        size: size,
        height: height,
        weight: weight,
      );

  factory EufemiaTextStyle.body({
    Color color,
    EufemiaFontSize size = EufemiaFontSize.body,
    EufemiaLineHeight height = EufemiaLineHeight.body,
    EufemiaFontWeight weight = EufemiaFontWeight.normal,
  }) =>
      EufemiaTextStyle(
        color: color,
        predefinedStyle: EufemiaTextPredefinedStyle.body,
        size: size,
        height: height,
        weight: weight,
      );

  factory EufemiaTextStyle.bodyEmphasized({
    Color color,
    EufemiaFontSize size = EufemiaFontSize.body,
    EufemiaLineHeight height = EufemiaLineHeight.body,
    EufemiaFontWeight weight = EufemiaFontWeight.emphasized,
  }) =>
      EufemiaTextStyle(
        color: color,
        predefinedStyle: EufemiaTextPredefinedStyle.bodyEmphasized,
        size: size,
        height: height,
        weight: weight,
      );

  factory EufemiaTextStyle.title({
    Color color,
    EufemiaFontSize size = EufemiaFontSize.title,
    EufemiaLineHeight height = EufemiaLineHeight.title,
    EufemiaFontWeight weight = EufemiaFontWeight.normal,
  }) =>
      EufemiaTextStyle(
        color: color,
        predefinedStyle: EufemiaTextPredefinedStyle.title,
        size: size,
        height: height,
        weight: weight,
      );

  factory EufemiaTextStyle.titleDemi({
    Color color,
    EufemiaFontSize size = EufemiaFontSize.title,
    EufemiaLineHeight height = EufemiaLineHeight.title,
    EufemiaFontWeight weight = EufemiaFontWeight.demi,
  }) =>
      EufemiaTextStyle(
        color: color,
        predefinedStyle: EufemiaTextPredefinedStyle.titleDemi,
        size: size,
        height: height,
        weight: weight,
      );

  factory EufemiaTextStyle.titleEmphasized({
    Color color,
    EufemiaFontSize size = EufemiaFontSize.title,
    EufemiaLineHeight height = EufemiaLineHeight.title,
    EufemiaFontWeight weight = EufemiaFontWeight.emphasized,
  }) =>
      EufemiaTextStyle(
        color: color,
        predefinedStyle: EufemiaTextPredefinedStyle.titleEmphasized,
        size: size,
        height: height,
        weight: weight,
      );

  factory EufemiaTextStyle.titleMedium({
    Color color,
    EufemiaFontSize size = EufemiaFontSize.titleMedium,
    EufemiaLineHeight height = EufemiaLineHeight.titleMedium,
    EufemiaFontWeight weight = EufemiaFontWeight.normal,
  }) =>
      EufemiaTextStyle(
        color: color,
        predefinedStyle: EufemiaTextPredefinedStyle.titleMedium,
        size: size,
        height: height,
        weight: weight,
      );

  factory EufemiaTextStyle.titleMediumEmphasized({
    Color color,
    EufemiaFontSize size = EufemiaFontSize.titleMedium,
    EufemiaLineHeight height = EufemiaLineHeight.titleMedium,
    EufemiaFontWeight weight = EufemiaFontWeight.emphasized,
  }) =>
      EufemiaTextStyle(
        color: color,
        predefinedStyle: EufemiaTextPredefinedStyle.titleMediumEmphasized,
        size: size,
        height: height,
        weight: weight,
      );

  factory EufemiaTextStyle.titleLarge({
    Color color,
    EufemiaFontSize size = EufemiaFontSize.titleLarge,
    EufemiaLineHeight height = EufemiaLineHeight.titleLarge,
    EufemiaFontWeight weight = EufemiaFontWeight.normal,
  }) =>
      EufemiaTextStyle(
        color: color,
        predefinedStyle: EufemiaTextPredefinedStyle.titleLarge,
        size: size,
        height: height,
        weight: weight,
      );

  factory EufemiaTextStyle.button({
    Color color,
    EufemiaFontSize size = EufemiaFontSize.button,
    EufemiaLineHeight height = EufemiaLineHeight.button,
    EufemiaFontWeight weight = EufemiaFontWeight.normal,
  }) =>
      EufemiaTextStyle(
        color: color,
        predefinedStyle: EufemiaTextPredefinedStyle.button,
        size: size,
        height: height,
        weight: weight,
      );

  factory EufemiaTextStyle.buttonEmphasized({
    Color color,
    EufemiaFontSize size = EufemiaFontSize.button,
    EufemiaLineHeight height = EufemiaLineHeight.button,
    EufemiaFontWeight weight = EufemiaFontWeight.emphasized,
  }) =>
      EufemiaTextStyle(
        color: color,
        predefinedStyle: EufemiaTextPredefinedStyle.buttonEmphasized,
        size: size,
        height: height,
        weight: weight,
      );

  factory EufemiaTextStyle.buttonSmall({
    Color color,
    EufemiaFontSize size = EufemiaFontSize.buttonSmall,
    EufemiaLineHeight height = EufemiaLineHeight.buttonSmall,
    EufemiaFontWeight weight = EufemiaFontWeight.normal,
  }) =>
      EufemiaTextStyle(
        color: color,
        predefinedStyle: EufemiaTextPredefinedStyle.buttonSmall,
        size: size,
        height: height,
        weight: weight,
      );

  factory EufemiaTextStyle.buttonSmallEmphasized({
    Color color,
    EufemiaFontSize size = EufemiaFontSize.button,
    EufemiaLineHeight height = EufemiaLineHeight.button,
    EufemiaFontWeight weight = EufemiaFontWeight.emphasized,
  }) =>
      EufemiaTextStyle(
        color: color,
        predefinedStyle: EufemiaTextPredefinedStyle.buttonEmphasized,
        size: size,
        height: height,
        weight: weight,
      );
}

extension EufemiaTextStyleExtensions on EufemiaTextStyle {
  EufemiaTextStyle loadPredefined(BuildContext context,
      {EufemiaTypographyData typography}) {
    assert(context != null || typography != null);
    typography ??= EufemiaTypography.of(context);
    if (predefinedStyle != null &&
        predefinedStyle != EufemiaTextPredefinedStyle.none) {
      return predefinedStyle.toStyle(typography: typography);
    }

    return this;
  }

  TextStyle toTextStyle(BuildContext context,
      {EufemiaTypographyData typography}) {
    assert(context != null || typography != null);
    typography ??= EufemiaTypography.of(context);

    var style = loadPredefined(context, typography: typography);

    final color = (this.color ?? style.color) ??
        DefaultTextStyle.of(context)?.style?.color;
    final fontFamily =
        (family ?? style.family)?.toFontFamily(typography: typography) ??
            typography.families.primary;
    final fontSize = (size ?? style.size)?.toPoints(typography: typography) ??
        typography.sizes.bodySize;
    final fontWeight =
        (weight ?? style.weight)?.toFontWeight(typography: typography) ??
            typography.weights.normal;
    final textDecoration = (this.textDecoration ?? style.textDecoration);
    final textDecorationStyle =
        (this.textDecorationStyle ?? style.textDecorationStyle);
    final textDecorationThickness =
        (this.textDecorationThickness ?? style.textDecorationThickness);
    final textDecorationColor =
        (this.textDecorationColor ?? style.textDecorationColor);

    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      decoration: textDecoration,
      decorationStyle: textDecorationStyle,
      decorationThickness: textDecorationThickness,
      decorationColor: textDecorationColor,
    );
  }
}
