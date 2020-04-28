import 'package:freezed_annotation/freezed_annotation.dart';

part 'spacing_data.freezed.dart';

@freezed
abstract class EufemiaSpacingData with _$EufemiaSpacingData {
  const factory EufemiaSpacingData._({
    @required double extraSmall,
    @required double small,
    @required double medium,
    @required double large,
    @required double extraLarge,
    @required double extraExtraLarge,
  }) = _EufemiaSpacingData;

  factory EufemiaSpacingData({
    double extraSmall,
    double small,
    double medium,
    double large,
    double extraLarge,
    double extraExtraLarge,
  }) {
    return EufemiaSpacingData._(
      extraSmall: extraSmall ?? 4.0,
      small: small ?? 8.0,
      medium: medium ?? 16.0,
      large: large ?? 24.0,
      extraLarge: extraLarge ?? 32.0,
      extraExtraLarge: extraExtraLarge ?? 40.0,
    );
  }

  factory EufemiaSpacingData.fallback() => EufemiaSpacingData(
        extraSmall: 4.0,
        small: 8.0,
        medium: 16.0,
        large: 24.0,
        extraLarge: 32.0,
        extraExtraLarge: 40.0,
      );
}
