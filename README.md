# DNB Design System 👨‍🎨

![eufemia_flutter](https://github.com/dnb-asa/eufemia_flutter/workflows/Dart%20CI/badge.svg) ![pub](https://img.shields.io/pub/v/eufemia?logo=flutter) [![style: pedantic](https://img.shields.io/badge/style-pedantic-9cf)](https://github.com/dart-lang/pedantic)

![preview](https://github.com/dnb-asa/eufemia_flutter/blob/master/assets/preview.png?raw=true)

> **DISCLAIMER**: This package is in an early stage

## Eufemia

![pub](https://img.shields.io/pub/v/eufemia?logo=flutter)

### Setup

Fonts and icons needs to be bundled with your app. Add the following to your `pubspec.yaml`:

```yaml
flutter:
  uses-material-design: true

  fonts:
    - family: EufemiaIcons
      fonts:
        - asset: packages/eufemia/fonts/EufemiaIcons.ttf

    - family: DNB Sans
      fonts:
        - asset: packages/eufemia/fonts/DNB-Light.otf
          weight: 300
        - asset: packages/eufemia/fonts/DNB-Regular.otf
          weight: 400
        - asset: packages/eufemia/fonts/DNB-Medium.otf
          weight: 500
        - asset: packages/eufemia/fonts/DNB-Bold.otf
          weight: 600
        - asset: packages/eufemia/fonts/DNB-LightItalic.otf
          weight: 300
          style: italic
        - asset: packages/eufemia/fonts/DNB-RegularItalic.otf
          weight: 400
          style: italic
        - asset: packages/eufemia/fonts/DNB-MediumItalic.otf
          weight: 500
          style: italic
        - asset: packages/eufemia/fonts/DNB-BoldItalic.otf
          weight: 600
          style: italic

    - family: DNB Mono
      fonts:
        - asset: packages/eufemia/fonts/DNBMono-Light.otf
          weight: 300
        - asset: packages/eufemia/fonts/DNBMono-Regular.otf
          weight: 400
        - asset: packages/eufemia/fonts/DNBMono-Medium.otf
          weight: 500
        - asset: packages/eufemia/fonts/DNBMono-Bold.otf
          weight: 600
        - asset: packages/eufemia/fonts/DNBMono-LightItalic.otf
          weight: 300
          style: italic
        - asset: packages/eufemia/fonts/DNBMono-RegularItalic.otf
          weight: 400
          style: italic
        - asset: packages/eufemia/fonts/DNBMono-MediumItalic.otf
          weight: 500
          style: italic
        - asset: packages/eufemia/fonts/DNBMono-BoldItalic.otf
          weight: 600
          style: italic
```

### How to use

Wrap your app in an `Eufemia` widget, and provide the `EufemiaData` with the `palette`, `spacing`, `button` and optionally `darkPalette` parameters:

```dart
Eufemia(
  data: EufemiaData(
    palette: EufemiaPaletteData.fallback(),
    spacing: EufemiaSpacingData.fallback(),
    button: EufemiaButtonThemeData.fallback(),
    darkPalette: EufemiaPaletteData.dark(),
  ),
),
```

To use Material widgets, e.g. in a `MaterialApp` tree, use the provided adapter to provide a Material Theme:

```dart
final adapter = EufemiaThemeAdapter(context);

return MaterialApp(
  theme: adapter.theme,
  ...
);
```

The Eufemia provider with all the theming data can be accessed using

```dart
final eufemia = Eufemia.of(context)
```

## Components

There are multiple UI components

## Palette

**This API is subject to change**

The `EufemiaPaletteData` class is a collection of colors that are used throughout the library of components. You can create your own, or use several presets, like the `saga`, `standard`, `dark` and `privateBanking` factories.

The palette provider can be accessed using

```dart
final palette = EufemiaPalette.of(context)
```

## Typography

If using the included themes, fonts are automatically set up. Otherwise, specify the `fontFamily` and `package` properties:

```dart
TextStyle(
  fontFamily: 'DNB Sans',
  package: 'eufemia',
)
```

The typography provider can be accessed using

```dart
final typography = EufemiaTypography.of(context)
```

## Spacing

The `EufemiaSpacingData` class defines the different kinds of spacing used throughout the app. By default, it provides the standard spacings defined by the Eufemia design system:

- `extraSmall: 4.0`
- `small: 8.0`
- `medium : 16.0`
- `large: 24.0`
- `extraLarge: 32.0`
- `extraExtraLarge: 40.0`

The spacing provider can be accessed using

```dart
final spacing = EufemiaSpacing.of(context)
```

## Desktop

Desktop targets are supported but not currently tested extensively, but may be prioritized in the future.
a

## Web

Web targets are supported, but the Web APIs are unstable, and the target is not tested at all. If building a web application, check out [eufemia for web](https://github.com/dnbexperience/eufemia) for a web native version.
