import 'package:eufemia/palette.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:derived_colors/derived_colors.dart';

import 'state.dart';
import 'theme.dart';

part 'style.freezed.dart';

const _defaultEufemiaPrimaryDeltaFactor = .05;
const _defaultEufemiaSecondaryDeltaFactor = .075;
const _defaultEufemiaVividDeltaFactor = .16;
const _defaultEufemiaFabShadowDeltaFactor = .072;
const _defaultEufemiaFabDeltaFactor = .283;

/// {@category Components}
/// {@subCategory Buttons}
/// A style class for [EufemiaButton] that wraps [EufemiaButtonState] instances
/// for the decorative parameters of a button.
@freezed
abstract class EufemiaButtonStyle with _$EufemiaButtonStyle {
  static const defaultTransitionDuration = Duration(milliseconds: 80);

  const factory EufemiaButtonStyle({
    @Default(EufemiaButtonStyle.defaultTransitionDuration) Duration duration,
    @required EufemiaButtonState<double> opacity,
    @required EufemiaButtonState<TextStyle> textStyle,
    @required EufemiaButtonState<IconThemeData> iconTheme,
    @required EufemiaButtonState<EdgeInsets> padding,
    @required EufemiaButtonState<BoxDecoration> decoration,
  }) = _EufemiaButtonStyle;

  factory EufemiaButtonStyle.primary({
    Color backgroundColor = EufemiaColors.seaGreen,
    Color foregroundColor = EufemiaColors.white,
    EufemiaButtonSize size = EufemiaButtonSize.medium,
    IconThemeData iconTheme,
    TextStyle textStyle,
    BuildContext context,
  }) {
    final buttonTheme = context != null ? EufemiaButtonTheme.of(context) : null;
    foregroundColor ??= textStyle.color;
    backgroundColor = backgroundColor ?? buttonTheme?.fill;
    textStyle = size.toTextStyle(
      textStyle ?? buttonTheme?.textStyle,
    );
    iconTheme = size.toIconTheme(
      iconTheme ?? buttonTheme?.iconTheme,
    );
    var decoration = size.toDecoration(buttonTheme?.cornerRadius);

    final padding = size.toPadding();

    return EufemiaButtonStyle(
      padding: EufemiaButtonState(enabled: padding),
      opacity: EufemiaButtonState(
        enabled: 1.0,
        disabled: .5,
      ),
      decoration: EufemiaButtonState(
        enabled: decoration.copyWith(
          color: backgroundColor,
        ),
        hover: decoration.copyWith(
          color: backgroundColor.darken(
            _defaultEufemiaPrimaryDeltaFactor * .5,
          ),
        ),
        active: decoration.copyWith(
          color: backgroundColor.darken(
            _defaultEufemiaPrimaryDeltaFactor,
          ),
        ),
      ),
      textStyle: EufemiaButtonState(
        enabled: textStyle.copyWith(color: foregroundColor),
        hover: textStyle.copyWith(
          color: foregroundColor.withOpacity(.9),
        ),
        active: textStyle.copyWith(
          color: foregroundColor.withOpacity(.8),
        ),
      ),
      iconTheme: EufemiaButtonState(
        enabled: iconTheme.copyWith(color: foregroundColor),
        hover: iconTheme.copyWith(
          color: foregroundColor.withOpacity(.9),
        ),
        active: iconTheme.copyWith(
          color: foregroundColor.withOpacity(.8),
        ),
      ),
    );
  }

  factory EufemiaButtonStyle.vivid({
    Color backgroundColor = EufemiaColors.accentYellow,
    Color borderColor,
    Color foregroundColor = EufemiaColors.oceanGreen,
    EufemiaButtonSize size = EufemiaButtonSize.medium,
    IconThemeData iconTheme,
    TextStyle textStyle,
    BuildContext context,
  }) {
    final buttonTheme = context != null ? EufemiaButtonTheme.of(context) : null;
    backgroundColor = backgroundColor ?? buttonTheme?.fill;
    textStyle = size.toTextStyle(
      textStyle ?? buttonTheme?.textStyle,
    );
    iconTheme = size.toIconTheme(
      iconTheme ?? buttonTheme?.iconTheme,
    );
    var decoration = size.toDecoration(buttonTheme?.cornerRadius);

    final padding = size.toPadding();

    return EufemiaButtonStyle(
      padding: EufemiaButtonState(enabled: padding),
      opacity: EufemiaButtonState(
        enabled: 1.0,
        disabled: .5,
      ),
      decoration: EufemiaButtonState(
        enabled: decoration.copyWith(color: backgroundColor),
        hover: decoration.copyWith(
          color: backgroundColor.darken(_defaultEufemiaVividDeltaFactor * .5),
        ),
        active: decoration.copyWith(
          color: backgroundColor.darken(_defaultEufemiaVividDeltaFactor),
        ),
      ),
      textStyle: EufemiaButtonState(
        enabled: textStyle.copyWith(color: foregroundColor),
        hover: textStyle.copyWith(
          color: foregroundColor.withOpacity(.9),
        ),
        active: textStyle.copyWith(
          color: foregroundColor.withOpacity(.8),
        ),
      ),
      iconTheme: EufemiaButtonState(
        enabled: iconTheme.copyWith(color: foregroundColor),
        hover: iconTheme.copyWith(
          color: foregroundColor.withOpacity(.9),
        ),
        active: iconTheme.copyWith(
          color: foregroundColor.withOpacity(.8),
        ),
      ),
    );
  }

  factory EufemiaButtonStyle.secondary({
    Color backgroundColor = EufemiaColors.white,
    Color borderColor = EufemiaColors.seaGreen,
    Color foregroundColor,
    EufemiaButtonSize size = EufemiaButtonSize.medium,
    IconThemeData iconTheme,
    TextStyle textStyle,
    BuildContext context,
  }) {
    final buttonTheme = context != null ? EufemiaButtonTheme.of(context) : null;
    final palette = context != null ? EufemiaPalette.of(context) : null;

    backgroundColor = backgroundColor ?? buttonTheme?.fill;
    foregroundColor ??= borderColor;
    textStyle = size.toTextStyle(
      textStyle ?? buttonTheme?.textStyle,
    );
    iconTheme = size.toIconTheme(
      iconTheme ?? buttonTheme?.iconTheme,
    );
    var decoration = size.toDecoration(buttonTheme?.cornerRadius);

    final padding = size.toPadding();

    final mix = Color.lerp(foregroundColor, backgroundColor, .99);

    return EufemiaButtonStyle(
      padding: EufemiaButtonState(enabled: padding),
      opacity: EufemiaButtonState(
        enabled: 1.0,
        disabled: .5,
      ),
      decoration: EufemiaButtonState(
        enabled: decoration.copyWith(
          color: backgroundColor,
          border: Border.all(
            color: borderColor,
          ),
        ),
        hover: decoration.copyWith(
          color: palette?.bright ?? true
              ? mix.darken(_defaultEufemiaSecondaryDeltaFactor * .5)
              : mix.lighten(_defaultEufemiaPrimaryDeltaFactor * .5),
          border: Border.all(
            color: borderColor.darken(_defaultEufemiaSecondaryDeltaFactor * .5),
          ),
        ),
        active: decoration.copyWith(
          color: palette?.bright ?? true
              ? mix.darken(_defaultEufemiaSecondaryDeltaFactor)
              : mix.lighten(_defaultEufemiaSecondaryDeltaFactor),
          border: Border.all(
            color: borderColor.darken(_defaultEufemiaSecondaryDeltaFactor),
          ),
        ),
      ),
      textStyle: EufemiaButtonState(
        enabled: textStyle.copyWith(color: foregroundColor),
        hover: textStyle.copyWith(
          color: foregroundColor.withOpacity(.9),
        ),
        active: textStyle.copyWith(
          color: foregroundColor.withOpacity(.8),
        ),
      ),
      iconTheme: EufemiaButtonState(
        enabled: iconTheme.copyWith(color: foregroundColor),
        hover: iconTheme.copyWith(
          color: foregroundColor.withOpacity(.9),
        ),
        active: iconTheme.copyWith(
          color: foregroundColor.withOpacity(.8),
        ),
      ),
    );
  }

  factory EufemiaButtonStyle.text({
    Color backgroundColor = EufemiaColors.subtleGray,
    Color foregroundColor = EufemiaColors.seaGreen,
    EufemiaButtonSize size = EufemiaButtonSize.medium,
    IconThemeData iconTheme,
    TextStyle textStyle,
    BuildContext context,
  }) {
    final buttonTheme = context != null ? EufemiaButtonTheme.of(context) : null;
    foregroundColor ??= textStyle.color;
    backgroundColor = backgroundColor ?? buttonTheme?.fill;
    textStyle = size.toTextStyle(
      textStyle ?? buttonTheme?.textStyle,
    );
    iconTheme = size.toIconTheme(
      iconTheme ?? buttonTheme?.iconTheme,
    );

    var decoration = size.toDecoration(4.0);

    final padding = size.toPadding(all: 4.0);

    return EufemiaButtonStyle(
      padding: EufemiaButtonState(enabled: padding),
      opacity: EufemiaButtonState(
        enabled: 1.0,
        disabled: .5,
      ),
      decoration: EufemiaButtonState(
        enabled: decoration.copyWith(
          color: backgroundColor.withOpacity(0),
        ),
        hover: decoration.copyWith(
          color: Color.lerp(backgroundColor, foregroundColor, .05).darken(.02),
        ),
        active: decoration.copyWith(
          color: Color.lerp(backgroundColor, foregroundColor, .05).darken(.05),
        ),
      ),
      textStyle: EufemiaButtonState(
        enabled: textStyle.copyWith(color: foregroundColor),
        hover: textStyle.copyWith(
          color: foregroundColor.withOpacity(.9),
        ),
        active: textStyle.copyWith(
          color: foregroundColor.withOpacity(.8),
        ),
      ),
      iconTheme: EufemiaButtonState(
        enabled: iconTheme.copyWith(color: foregroundColor),
        hover: iconTheme.copyWith(
          color: foregroundColor.withOpacity(.9),
        ),
        active: iconTheme.copyWith(
          color: foregroundColor.withOpacity(.8),
        ),
      ),
    );
  }

  factory EufemiaButtonStyle.fab({
    Color backgroundColor = EufemiaColors.seaGreen,
    Color foregroundColor = EufemiaColors.white,
    EufemiaButtonSize size = EufemiaButtonSize.medium,
    IconThemeData iconTheme,
    TextStyle textStyle,
    BuildContext context,
  }) {
    final buttonTheme = context != null ? EufemiaButtonTheme.of(context) : null;
    foregroundColor ??= textStyle.color;
    backgroundColor = backgroundColor ?? buttonTheme?.fill;
    textStyle = size.toTextStyle(
      textStyle ?? buttonTheme?.textStyle,
    );
    iconTheme = size.toIconTheme(
      iconTheme ?? buttonTheme?.iconTheme,
    );
    var decoration = BoxDecoration();

    final padding = size.toPadding();

    final shadow = BoxShadow(
      color: backgroundColor
          .lighten(_defaultEufemiaFabShadowDeltaFactor)
          .withOpacity(.3),
      spreadRadius: 1.0,
      blurRadius: 16.0,
      offset: Offset(0, 8),
    );

    return EufemiaButtonStyle(
      padding: EufemiaButtonState(enabled: padding),
      opacity: EufemiaButtonState(
        enabled: 1.0,
        disabled: .5,
      ),
      decoration: EufemiaButtonState(
        enabled: decoration.copyWith(
          color: backgroundColor,
          shape: BoxShape.circle,
          boxShadow: [shadow],
        ),
        hover: decoration.copyWith(
          color: backgroundColor.darken(
            _defaultEufemiaFabDeltaFactor * .5,
          ),
          shape: BoxShape.circle,
          boxShadow: [shadow],
        ),
        active: decoration.copyWith(
          color: backgroundColor.darken(
            _defaultEufemiaFabDeltaFactor,
          ),
          shape: BoxShape.circle,
          boxShadow: [shadow],
        ),
      ),
      textStyle: EufemiaButtonState(
        enabled: textStyle.copyWith(color: foregroundColor),
        hover: textStyle.copyWith(
          color: foregroundColor.withOpacity(.9),
        ),
        active: textStyle.copyWith(
          color: foregroundColor.withOpacity(.8),
        ),
      ),
      iconTheme: EufemiaButtonState(
        enabled: iconTheme.copyWith(color: foregroundColor),
        hover: iconTheme.copyWith(
          color: foregroundColor.withOpacity(.9),
        ),
        active: iconTheme.copyWith(
          color: foregroundColor.withOpacity(.8),
        ),
      ),
    );
  }
}

/// {@template eufemia.components.EufemiaButtonSize}
/// The size of the [EufemiaButton], according to the Eufemia specifications
/// {@endtemplate}
enum EufemiaButtonSize {
  small,
  medium,
}

/// {@category Components}
/// {@subCategory extensions}
/// An extension that converts Eufemia-specific values to default
/// Flutter-friendly values
extension EufemiaButtonSizeExtensions on EufemiaButtonSize {
  /// Converts [EufemiaButtonSize] to according[EdgeInsets] insets
  EdgeInsets toPadding({double vertical, double horizontal, double all}) {
    vertical ??= 14.5;
    horizontal ??= 24.0;

    switch (this) {
      case EufemiaButtonSize.small:
        vertical = vertical / 1.933;
        horizontal = 16.0 / 1.5;
        break;
      default:
        break;
    }

    if (all != null) {
      return EdgeInsets.all(all);
    }
    return EdgeInsets.symmetric(
      horizontal: horizontal,
      vertical: vertical,
    );
  }

  /// Converts [EufemiaButtonSize] to [BoxDecoration] for the [Container] widget
  BoxDecoration toDecoration([double baseRadius = 10.0]) {
    baseRadius ??= 10.0;

    return BoxDecoration(borderRadius: BorderRadius.circular(baseRadius));
  }

  /// Converts [EufemiaButtonSize] to the correct [TextStyle] for the size
  TextStyle toTextStyle(TextStyle base) {
    base ??= TextStyle(fontSize: 16.0);
    switch (this) {
      case EufemiaButtonSize.small:
        return base.copyWith(fontSize: base.fontSize * .875);
      case EufemiaButtonSize.medium:
        return base.copyWith(fontSize: base.fontSize);
      default:
        return base;
    }
  }

  /// Converts [EufemiaButtonSize] to the correct [IconThemeData] for the size
  IconThemeData toIconTheme(IconThemeData base) {
    base ??= IconThemeData(size: 16.0);
    switch (this) {
      case EufemiaButtonSize.small:
        return base.copyWith(size: base.size * .5);
      case EufemiaButtonSize.medium:
        return base.copyWith(size: base.size);
      default:
        return base;
    }
  }
}
