# Typography

Provides font assets, typography and text styling features.

The `EufemiaTypographyData` class is a collection of text styles that are used throughout the library of components. You can create your own, but the default `fallback` styles are as specified by the Eufemia design system.

The typography provider can be accessed using

```dart
final typography = EufemiaTypography.of(context)
```

If using the bundled themes, fonts are automatically set up. Otherwise, specify the `fontFamily` and `package` properties:

```dart
TextStyle(
  fontFamily: 'DNB Sans',
  package: 'eufemia',
)
```
