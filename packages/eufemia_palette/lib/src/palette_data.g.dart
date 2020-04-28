// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'palette_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EufemiaPaletteData _$_$_EufemiaPaletteDataFromJson(
    Map<String, dynamic> json) {
  return _$_EufemiaPaletteData(
    brightness: _$enumDecodeNullable(_$BrightnessEnumMap, json['brightness']),
    primary: const ColorJsonConverter().fromJson(json['primary']),
    onPrimary: const ColorJsonConverter().fromJson(json['onPrimary']),
    secondary: const ColorJsonConverter().fromJson(json['secondary']),
    info: const ColorJsonConverter().fromJson(json['info']),
    success: const ColorJsonConverter().fromJson(json['success']),
    error: const ColorJsonConverter().fromJson(json['error']),
    warning: const ColorJsonConverter().fromJson(json['warning']),
    dark: const ColorJsonConverter().fromJson(json['dark']),
    light: const ColorJsonConverter().fromJson(json['light']),
    black: const ColorJsonConverter().fromJson(json['black']),
    grey: const ColorJsonConverter().fromJson(json['grey']),
    white: const ColorJsonConverter().fromJson(json['white']),
    text: const ColorJsonConverter().fromJson(json['text']),
    buttonText: const ColorJsonConverter().fromJson(json['buttonText']),
    icon: const ColorJsonConverter().fromJson(json['icon']),
    card: const ColorJsonConverter().fromJson(json['card']),
    cardAccent: const ColorJsonConverter().fromJson(json['cardAccent']),
    button: const ColorJsonConverter().fromJson(json['button']),
    toggle: const ColorJsonConverter().fromJson(json['toggle']),
    toggleInactive: const ColorJsonConverter().fromJson(json['toggleInactive']),
  );
}

Map<String, dynamic> _$_$_EufemiaPaletteDataToJson(
        _$_EufemiaPaletteData instance) =>
    <String, dynamic>{
      'brightness': _$BrightnessEnumMap[instance.brightness],
      'primary': const ColorJsonConverter().toJson(instance.primary),
      'onPrimary': const ColorJsonConverter().toJson(instance.onPrimary),
      'secondary': const ColorJsonConverter().toJson(instance.secondary),
      'info': const ColorJsonConverter().toJson(instance.info),
      'success': const ColorJsonConverter().toJson(instance.success),
      'error': const ColorJsonConverter().toJson(instance.error),
      'warning': const ColorJsonConverter().toJson(instance.warning),
      'dark': const ColorJsonConverter().toJson(instance.dark),
      'light': const ColorJsonConverter().toJson(instance.light),
      'black': const ColorJsonConverter().toJson(instance.black),
      'grey': const ColorJsonConverter().toJson(instance.grey),
      'white': const ColorJsonConverter().toJson(instance.white),
      'text': const ColorJsonConverter().toJson(instance.text),
      'buttonText': const ColorJsonConverter().toJson(instance.buttonText),
      'icon': const ColorJsonConverter().toJson(instance.icon),
      'card': const ColorJsonConverter().toJson(instance.card),
      'cardAccent': const ColorJsonConverter().toJson(instance.cardAccent),
      'button': const ColorJsonConverter().toJson(instance.button),
      'toggle': const ColorJsonConverter().toJson(instance.toggle),
      'toggleInactive':
          const ColorJsonConverter().toJson(instance.toggleInactive),
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$BrightnessEnumMap = {
  Brightness.dark: 'dark',
  Brightness.light: 'light',
};
