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

/// {@category Typography}
/// A text style from the Eufemia design system.
@freezed
abstract class EufemiaTextStyle with _$EufemiaTextStyle {
  /// Default factory.
  const factory EufemiaTextStyle({
    /// The text color.
    @nullable Color color,

    /// The text alignment.
    @nullable TextAlign textAlign,

    /// The text direction.
    @nullable TextDirection textDirection,

    /// The text decoration style.
    @nullable TextDecorationStyle textDecorationStyle,

    /// The thickness of the [textDecorationStyle]
    @nullable double textDecorationThickness,

    /// The color of the [textDecorationStyle]
    @nullable Color textDecorationColor,

    /// The predefined Eufemia text style, if any.
    @nullable EufemiaTextPredefinedStyle predefinedStyle,

    /// The text decoration, if any.
    @nullable TextDecoration textDecoration,

    /// The spacing between each letter of the text.
    @nullable double letterSpacing,

    /// The Eufemia-specific font size.
    @nullable EufemiaFontSize size,

    /// The Eufemia-specific font weight.
    @nullable EufemiaFontWeight weight,

    /// The Eufemia-specific font family.
    @nullable EufemiaFontFamily family,

    /// The eufemia-speicfic line height.
    @nullable EufemiaLineHeight height,
  }) = _EufemiaTextStyle;

  /// Creates a default Eufemia caption style.
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

  /// Creates a default Eufemia emphasized caption style.
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

  /// Creates a default Eufemia footnote style.
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

  /// Creates a default Eufemia emphasized footnote style.
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

  /// Creates a default Eufemia subhead style.
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

  /// Creates a default Eufemia emphasized subhead style.
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

  /// Creates a default Eufemia body style.
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

  /// Creates a default Eufemia emphasized body style.
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

  /// Creates a default Eufemia title tyle.
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

  /// Creates a default Eufemia demi title style.
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

  /// Creates a default Eufemia emphasized title style.
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

  /// Creates a default Eufemia medium title style.
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

  /// Creates a default Eufemia emphasized medium title style.
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

  /// Creates a default Eufemia large title style.
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

  /// Creates a default Eufemia button style.
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

  /// Creates a default Eufemia emphasized button style.
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

  /// Creates a default Eufemia small button style.
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

  /// Creates a default Eufemia emphasized small button style.
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

/// {@category Typography}
/// {@macro eufemia.extension}
extension EufemiaTextStyleExtensions on EufemiaTextStyle {
  /// Returns the predefined style of this [EufemiaTextStyle] from either
  /// [context] or [typopgraphy]. Both cannot be set.
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

  /// Returns a Flutter [TextStyle] from this [EufemiaTextStyle].
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
