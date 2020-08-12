import 'package:flutter/widgets.dart';

import 'text_style.dart';
import 'typography_data.dart';

EufemiaTypographyData fallbackTypography({
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
  Color buttonEmphasizedColor,
  Color buttonSmallColor,
  Color buttonSmallEmhpasizedColor,
}) {
  return EufemiaTypographyData(
    sizes: eufemiaDefaultTypographySizes,
    weights: eufemiaDefaultTypographyWeights,
    families: eufemiaDefaultTypographyFamilies,
    heights: eufemiaDefaultTypographyHeights,
    styles: fallbackStyles(
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
      buttonEmphasizedColor: buttonEmphasizedColor,
      buttonSmallColor: buttonSmallColor,
      buttonSmallEmphasizedColor: buttonSmallEmhpasizedColor,
    ),
  );
}

EufemiaTypographyStyles fallbackStyles({
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
  Color buttonEmphasizedColor,
  Color buttonSmallColor,
  Color buttonSmallEmphasizedColor,
}) {
  return EufemiaTypographyStyles(
    caption: EufemiaTextStyle.caption(
      color: captionColor,
    ),
    captionEmphasized: EufemiaTextStyle.captionEmphasized(
      color: captionEmphasizedColor,
    ),
    footnote: EufemiaTextStyle.footnote(
      color: footnoteColor,
    ),
    footnoteEmphasized: EufemiaTextStyle.footnoteEmphasized(
      color: footnoteEmphasizedColor,
    ),
    subhead: EufemiaTextStyle.subhead(
      color: subheadColor,
    ),
    subheadEmphasized: EufemiaTextStyle.subheadEmphasized(
      color: subheadEmphasizedColor,
    ),
    body: EufemiaTextStyle.body(color: bodyColor),
    bodyEmphasized: EufemiaTextStyle.bodyEmphasized(
      color: bodyEmphasizedColor,
    ),
    title: EufemiaTextStyle.title(
      color: titleColor,
    ),
    titleDemi: EufemiaTextStyle.titleDemi(
      color: titleDemiColor,
    ),
    titleEmphasized: EufemiaTextStyle.titleEmphasized(
      color: titleEmphasizedColor,
    ),
    titleMedium: EufemiaTextStyle.titleMedium(
      color: titleMediumColor,
    ),
    titleMediumEmphasized: EufemiaTextStyle.titleMediumEmphasized(
      color: titleMediumEmphasizedColor,
    ),
    titleLarge: EufemiaTextStyle.titleLarge(
      color: titleLargeColor,
    ),
    button: EufemiaTextStyle.button(
      color: buttonColor,
    ),
    buttonEmphasized: EufemiaTextStyle.buttonEmphasized(
      color: buttonEmphasizedColor,
    ),
    buttonSmall: EufemiaTextStyle.buttonSmall(
      color: buttonSmallColor,
    ),
    buttonSmallEmphasized: EufemiaTextStyle.buttonSmallEmphasized(
      color: buttonSmallEmphasizedColor,
    ),
  );
}

const eufemiaDefaultTypographyFamilies = EufemiaTypographyFamilies(
  primary: 'DNB Sans',
  monospace: 'DNB Mono',
);

const eufemiaDefaultTypographySizes = EufemiaTypographySizes(
  captionSize: 11.0,
  footnoteSize: 13.0,
  subheadSize: 15.0,
  bodySize: 17.0,
  titleSize: 20.0,
  titleMediumSize: 24.0,
  titleLargeSize: 34.0,
  buttonSize: 16.0,
  buttonSmallSize: 14.0,
);

const eufemiaDefaultTypographyHeights = EufemiaTypographyHeights(
  captionHeight: 1.33,
  footnoteHeight: 1.23,
  subheadHeight: 1.33,
  bodyHeight: 1.41,
  titleHeight: 1.40,
  titleMediumHeight: 1.33,
  titleLargeHeight: 1.29,
  buttonHeight: 1.18,
  buttonSmallHeight: 1.21,
);

const eufemiaDefaultTypographyWeights = EufemiaTypographyWeights(
  normal: FontWeight.w400,
  demi: FontWeight.w500,
  emphasized: FontWeight.w600,
);
