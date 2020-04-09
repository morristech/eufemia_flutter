# DNB Design System 👨‍🎨

![sigv4](https://github.com/dnb-asa/eufemia_flutter/workflows/Dart%20CI/badge.svg) ![pub](https://img.shields.io/pub/v/eufemia.svg) [![style: pedantic](https://img.shields.io/badge/style-pedantic-9cf)](https://github.com/dart-lang/pedantic) ![license](https://img.shields.io/github/license/dnb-asa/eufemia_flutter.svg)

![preview](https://github.com/dnb-asa/eufemia_flutter/blob/master/assets/preview.png?raw=true)

> **DISCLAIMER**: This package is in an early stage

## Themes

Two base themes are provided:

- `Eufemia.lightTheme()`
- `Eufemia.darkTheme()`

These can be extended using the `copyWith` method. Read more about `ThemeData` overrides [here](https://api.flutter.dev/flutter/material/ThemeData/copyWith.html).

## Fonts

If using the included themes, fonts are automatically set up. Otherwise, specify the `fontFamily` and `package` properties:

```dart
TextStyle(
  fontFamily: 'DNB Sans',
  package: 'eufemia',
)
```

## Desktop

Desktop targets are supported but not currently tested extensively, but may be prioritized in the future.

## Web

Web targets are supported, but the Web APIs are unstable, and the target is not tested at all. If building a web application, check out [eufemia for web](https://github.com/dnbexperience/eufemia) for a web version.
