import 'package:eufemia_palette/eufemia_palette.dart';
import 'package:eufemia_typography/eufemia_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme.freezed.dart';

@freezed
abstract class EufemiaButtonThemeData with _$EufemiaButtonThemeData {
  const factory EufemiaButtonThemeData({
    @required TextStyle textStyle,
    @required double cornerRadius,
    @required IconThemeData iconTheme,
    @required Color fill,
    @required Color borderColor,
    @required double borderWidth,
  }) = _EufemiaButtonThemeData;

  factory EufemiaButtonThemeData.fromTheme(ThemeData theme) {
    final textStyle = theme.textTheme.button;

    var iconTheme = theme.iconTheme ??
        IconThemeData(
          opacity: 1.0,
        );
    if (iconTheme.size == null) {
      iconTheme = iconTheme.copyWith(
        size: textStyle.fontSize * 1.2,
      );
    }

    return EufemiaButtonThemeData(
      fill: theme.accentColor,
      textStyle: textStyle,
      iconTheme: iconTheme,
      cornerRadius: 100.0,
      borderWidth: 1.0,
      borderColor: theme.accentColor,
    );
  }

  factory EufemiaButtonThemeData.fromEufemia(
    BuildContext context,
    EufemiaPaletteData palette,
    EufemiaTypographyData typography,
  ) {
    return EufemiaButtonThemeData(
      fill: palette.button,
      textStyle: typography.styles.button.copyWith
          .call(color: palette.onButton)
          .toTextStyle(context),
      iconTheme: IconThemeData(
        color: palette.icon,
      ),
      borderWidth: 1.0,
      cornerRadius: 100.0,
      borderColor: palette.button,
    );
  }

  factory EufemiaButtonThemeData.fallback() {
    final textStyle = TextStyle(fontSize: 16);

    return EufemiaButtonThemeData(
      fill: EufemiaColors.seaGreen,
      borderColor: EufemiaColors.seaGreen,
      textStyle: textStyle,
      cornerRadius: 100.0,
      borderWidth: 1.0,
      iconTheme: IconThemeData(
        opacity: 1.0,
        size: textStyle.fontSize * 1.3,
      ),
    );
  }
}

class EufemiaButtonTheme extends InheritedWidget {
  final EufemiaButtonThemeData data;

  const EufemiaButtonTheme({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  static EufemiaButtonThemeData of(BuildContext context) {
    var result =
        context.dependOnInheritedWidgetOfExactType<EufemiaButtonTheme>();
    if (result != null) {
      return result.data;
    }

    final theme = Theme.of(context);
    if (theme != null) {
      return EufemiaButtonThemeData.fromTheme(theme);
    }

    return EufemiaButtonThemeData.fallback();
  }

  @override
  bool updateShouldNotify(EufemiaButtonTheme oldWidget) {
    return data != oldWidget.data;
  }
}
