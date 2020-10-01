import 'package:eufemia/palette.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'text_style.dart';
import 'typography_data_fallback.dart';

part 'typography_data.freezed.dart';

/// {@category Typography}
/// A class containing the entire collection of styles, sizes, families, heights
/// and weights from the Eufemia design system.
@freezed
abstract class EufemiaTypographyData with _$EufemiaTypographyData {
  const factory EufemiaTypographyData({
    @required EufemiaTypographySizes sizes,
    @required EufemiaTypographyWeights weights,
    @required EufemiaTypographyFamilies families,
    @required EufemiaTypographyStyles styles,
    @required EufemiaTypographyHeights heights,
  }) = _EufemiaTypographyData;

  /// Returns the default typography data from the Eufemia design system and
  /// applies all the given colors. These default to [EufemiaColors.coal].
  factory EufemiaTypographyData.fallback({
    Color captionColor,
    Color captionEmphasizedColor,
    Color footnoteColor,
    Color footnoteEmphasizedColor,
    Color subheadColor,
    Color subheadEmphasizedColor,
    Color bodyColor,
    Color bodyEmphasizedColor,
    Color titleColor,
    Color titleDemiColor,
    Color titleEmphasizedColor,
    Color titleMediumColor,
    Color titleMediumEmphasizedColor,
    Color titleLargeColor,
    Color buttonColor,
    Color buttonSmallColor,
  }) {
    captionColor ??= EufemiaColors.coal;
    captionEmphasizedColor ??= EufemiaColors.coal;
    footnoteColor ??= EufemiaColors.coal;
    footnoteEmphasizedColor ??= EufemiaColors.coal;
    subheadColor ??= EufemiaColors.coal;
    subheadEmphasizedColor ??= EufemiaColors.coal;
    bodyColor ??= EufemiaColors.coal;
    bodyEmphasizedColor ??= EufemiaColors.coal;
    titleColor ??= EufemiaColors.coal;
    titleDemiColor ??= EufemiaColors.coal;
    titleEmphasizedColor ??= EufemiaColors.coal;
    titleMediumColor ??= EufemiaColors.coal;
    titleMediumEmphasizedColor ??= EufemiaColors.coal;
    titleLargeColor ??= EufemiaColors.coal;
    buttonColor ??= EufemiaColors.white;
    buttonSmallColor ??= EufemiaColors.white;

    return fallbackTypography(
      captionColor: captionColor,
      captionEmphasizedColor: captionEmphasizedColor,
      footnoteColor: footnoteColor,
      footnoteEmphasizedColor: footnoteEmphasizedColor,
      subheadColor: subheadColor,
      subheadEmphasizedColor: subheadEmphasizedColor,
      bodyColor: bodyColor,
      bodyEmphasizedColor: bodyEmphasizedColor,
      titleColor: titleColor,
      titleDemiColor: titleDemiColor,
      titleEmphasizedColor: titleEmphasizedColor,
      titleMediumColor: titleMediumColor,
      titleMediumEmphasizedColor: titleMediumEmphasizedColor,
      titleLargeColor: titleLargeColor,
      buttonColor: buttonColor,
      buttonSmallColor: buttonSmallColor,
    );
  }
}

/// {@category Typography}
/// A data class containing the different typography sizes for the different
/// styles.
@freezed
abstract class EufemiaTypographySizes with _$EufemiaTypographySizes {
  const factory EufemiaTypographySizes({
    @required double captionSize,
    @required double footnoteSize,
    @required double subheadSize,
    @required double bodySize,
    @required double titleSize,
    @required double titleMediumSize,
    @required double titleLargeSize,
    @required double buttonSize,
    @required double buttonSmallSize,
  }) = _EufemiaTypographySizes;
}

/// {@category Typography}
/// A data class containing the different typography height for the different
/// styles.
@freezed
abstract class EufemiaTypographyHeights with _$EufemiaTypographyHeights {
  const factory EufemiaTypographyHeights({
    @required double captionHeight,
    @required double footnoteHeight,
    @required double subheadHeight,
    @required double bodyHeight,
    @required double titleHeight,
    @required double titleMediumHeight,
    @required double titleLargeHeight,
    @required double buttonHeight,
    @required double buttonSmallHeight,
  }) = _EufemiaTypographyHeights;
}

/// {@category Typography}
/// A data class containing the different typography families for the different
/// styles.
@freezed
abstract class EufemiaTypographyFamilies with _$EufemiaTypographyFamilies {
  const factory EufemiaTypographyFamilies({
    @required String primary,
    @required String monospace,
  }) = _EufemiaTypographyFamilies;
}

/// {@category Typography}
/// A data class containing the different typography weights for the different
/// styles.
@freezed
abstract class EufemiaTypographyWeights with _$EufemiaTypographyWeights {
  const factory EufemiaTypographyWeights({
    @required FontWeight normal,
    @required FontWeight emphasized,
    @required FontWeight demi,
  }) = _EufemiaTypographyWeights;
}

/// {@category Typography}
/// A data class containing the different typography styles.
@freezed
abstract class EufemiaTypographyStyles with _$EufemiaTypographyStyles {
  const factory EufemiaTypographyStyles({
    @required EufemiaTextStyle caption,
    @required EufemiaTextStyle captionEmphasized,
    @required EufemiaTextStyle footnote,
    @required EufemiaTextStyle footnoteEmphasized,
    @required EufemiaTextStyle subhead,
    @required EufemiaTextStyle subheadEmphasized,
    @required EufemiaTextStyle body,
    @required EufemiaTextStyle bodyEmphasized,
    @required EufemiaTextStyle title,
    @required EufemiaTextStyle titleDemi,
    @required EufemiaTextStyle titleEmphasized,
    @required EufemiaTextStyle titleMedium,
    @required EufemiaTextStyle titleMediumEmphasized,
    @required EufemiaTextStyle titleLarge,
    @required EufemiaTextStyle button,
    @required EufemiaTextStyle buttonEmphasized,
    @required EufemiaTextStyle buttonSmall,
    @required EufemiaTextStyle buttonSmallEmphasized,
  }) = _EufemiaTypographyStyles;
}
