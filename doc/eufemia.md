# Eufemia

Implementation of the DNB's Eufemia design system.

Contains different libraries split into different realms of the design system itself:

- Typography
- Spacing
- Components
- Palette

To set up Eufemia:

```dart
Eufemia(
  data: EufemiaData(
    palette: EufemiaPaletteData.fallback(),
    spacing: EufemiaSpacingData.fallback(),
    button: EufemiaButtonThemeData.fallback(),
    darkPalette: EufemiaPaletteData.dark(),
  ),
  child: YourApp(),
),
```

And to access Eufemia properties:

```dart
final typography = EufemiaTypography.of(context);
final palette = EufemiaPalette.of(context);
final spacing = EufemiaSpacing.of(context);

// Alternatively:
final eufemia = Eufemia.of(context);
final palette = eufemia.palette; // etc..
```
