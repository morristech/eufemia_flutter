/// Implementation of the DNB's Eufemia design system.
///
/// Contains different libraries split into different realms of the
/// design system itself:
///
/// * Typography
/// * Spacing
/// * Components
/// * Palette
///
/// To set up Eufemia:
/// {@tool snippet}
/// ```dart
/// Eufemia(
///   data: EufemiaData(
///     palette: EufemiaPaletteData.fallback(),
///     spacing: EufemiaSpacingData.fallback(),
///     button: EufemiaButtonThemeData.fallback(),
///     darkPalette: EufemiaPaletteData.dark(),
///   ),
///   child: YourApp(),
/// ),
/// ```
/// {@end-tool}
/// And to access Eufemia properties:
/// {@tool snippet}
/// ```dart
/// final typography = EufemiaTypography.of(context);
/// final palette = EufemiaPalette.of(context);
/// final spacing = EufemiaSpacing.of(context);
///
/// // Alternatively:
/// final eufemia = Eufemia.of(context);
/// final palette = eufemia.palette; // etc..
/// ```
/// {@end-tool}
library eufemia;

// Core libraries
export 'src/core/adapter.dart';
export 'src/core/eufemia_data.dart';
export 'src/core/eufemia.dart';
export 'src/core/language.dart';

export 'palette.dart';
export 'components.dart';
export 'spacing.dart';
export 'typography.dart';
