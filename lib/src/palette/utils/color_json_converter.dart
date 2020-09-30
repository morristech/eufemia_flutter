import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

/// {@category Palette}
/// {@subCategory utils}
/// A converter class for converting [Color] to JSON and vice versa
class ColorJsonConverter implements JsonConverter<Color, Object> {
  const ColorJsonConverter();

  @override
  Color fromJson(Object json) {
    if (json is double) {
      return Color(json.toInt());
    }
    if (json is int) {
      return Color(json);
    }

    return json as Color;
  }

  @override
  Object toJson(Color object) {
    return object.value;
  }
}
