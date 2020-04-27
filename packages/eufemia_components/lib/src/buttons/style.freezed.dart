// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$EufemiaButtonStyleTearOff {
  const _$EufemiaButtonStyleTearOff();

  _EufemiaButtonStyle call(
      {Duration duration = EufemiaButtonStyle.defaultTransitionDuration,
      @required EufemiaButtonState<double> opacity,
      @required EufemiaButtonState<TextStyle> textStyle,
      @required EufemiaButtonState<IconThemeData> iconTheme,
      @required EufemiaButtonState<EdgeInsets> padding,
      @required EufemiaButtonState<BoxDecoration> decoration}) {
    return _EufemiaButtonStyle(
      duration: duration,
      opacity: opacity,
      textStyle: textStyle,
      iconTheme: iconTheme,
      padding: padding,
      decoration: decoration,
    );
  }
}

// ignore: unused_element
const $EufemiaButtonStyle = _$EufemiaButtonStyleTearOff();

mixin _$EufemiaButtonStyle {
  Duration get duration;
  EufemiaButtonState<double> get opacity;
  EufemiaButtonState<TextStyle> get textStyle;
  EufemiaButtonState<IconThemeData> get iconTheme;
  EufemiaButtonState<EdgeInsets> get padding;
  EufemiaButtonState<BoxDecoration> get decoration;

  $EufemiaButtonStyleCopyWith<EufemiaButtonStyle> get copyWith;
}

abstract class $EufemiaButtonStyleCopyWith<$Res> {
  factory $EufemiaButtonStyleCopyWith(
          EufemiaButtonStyle value, $Res Function(EufemiaButtonStyle) then) =
      _$EufemiaButtonStyleCopyWithImpl<$Res>;
  $Res call(
      {Duration duration,
      EufemiaButtonState<double> opacity,
      EufemiaButtonState<TextStyle> textStyle,
      EufemiaButtonState<IconThemeData> iconTheme,
      EufemiaButtonState<EdgeInsets> padding,
      EufemiaButtonState<BoxDecoration> decoration});
}

class _$EufemiaButtonStyleCopyWithImpl<$Res>
    implements $EufemiaButtonStyleCopyWith<$Res> {
  _$EufemiaButtonStyleCopyWithImpl(this._value, this._then);

  final EufemiaButtonStyle _value;
  // ignore: unused_field
  final $Res Function(EufemiaButtonStyle) _then;

  @override
  $Res call({
    Object duration = freezed,
    Object opacity = freezed,
    Object textStyle = freezed,
    Object iconTheme = freezed,
    Object padding = freezed,
    Object decoration = freezed,
  }) {
    return _then(_value.copyWith(
      duration: duration == freezed ? _value.duration : duration as Duration,
      opacity: opacity == freezed
          ? _value.opacity
          : opacity as EufemiaButtonState<double>,
      textStyle: textStyle == freezed
          ? _value.textStyle
          : textStyle as EufemiaButtonState<TextStyle>,
      iconTheme: iconTheme == freezed
          ? _value.iconTheme
          : iconTheme as EufemiaButtonState<IconThemeData>,
      padding: padding == freezed
          ? _value.padding
          : padding as EufemiaButtonState<EdgeInsets>,
      decoration: decoration == freezed
          ? _value.decoration
          : decoration as EufemiaButtonState<BoxDecoration>,
    ));
  }
}

abstract class _$EufemiaButtonStyleCopyWith<$Res>
    implements $EufemiaButtonStyleCopyWith<$Res> {
  factory _$EufemiaButtonStyleCopyWith(
          _EufemiaButtonStyle value, $Res Function(_EufemiaButtonStyle) then) =
      __$EufemiaButtonStyleCopyWithImpl<$Res>;
  @override
  $Res call(
      {Duration duration,
      EufemiaButtonState<double> opacity,
      EufemiaButtonState<TextStyle> textStyle,
      EufemiaButtonState<IconThemeData> iconTheme,
      EufemiaButtonState<EdgeInsets> padding,
      EufemiaButtonState<BoxDecoration> decoration});
}

class __$EufemiaButtonStyleCopyWithImpl<$Res>
    extends _$EufemiaButtonStyleCopyWithImpl<$Res>
    implements _$EufemiaButtonStyleCopyWith<$Res> {
  __$EufemiaButtonStyleCopyWithImpl(
      _EufemiaButtonStyle _value, $Res Function(_EufemiaButtonStyle) _then)
      : super(_value, (v) => _then(v as _EufemiaButtonStyle));

  @override
  _EufemiaButtonStyle get _value => super._value as _EufemiaButtonStyle;

  @override
  $Res call({
    Object duration = freezed,
    Object opacity = freezed,
    Object textStyle = freezed,
    Object iconTheme = freezed,
    Object padding = freezed,
    Object decoration = freezed,
  }) {
    return _then(_EufemiaButtonStyle(
      duration: duration == freezed ? _value.duration : duration as Duration,
      opacity: opacity == freezed
          ? _value.opacity
          : opacity as EufemiaButtonState<double>,
      textStyle: textStyle == freezed
          ? _value.textStyle
          : textStyle as EufemiaButtonState<TextStyle>,
      iconTheme: iconTheme == freezed
          ? _value.iconTheme
          : iconTheme as EufemiaButtonState<IconThemeData>,
      padding: padding == freezed
          ? _value.padding
          : padding as EufemiaButtonState<EdgeInsets>,
      decoration: decoration == freezed
          ? _value.decoration
          : decoration as EufemiaButtonState<BoxDecoration>,
    ));
  }
}

class _$_EufemiaButtonStyle
    with DiagnosticableTreeMixin
    implements _EufemiaButtonStyle {
  const _$_EufemiaButtonStyle(
      {this.duration = EufemiaButtonStyle.defaultTransitionDuration,
      @required this.opacity,
      @required this.textStyle,
      @required this.iconTheme,
      @required this.padding,
      @required this.decoration})
      : assert(duration != null),
        assert(opacity != null),
        assert(textStyle != null),
        assert(iconTheme != null),
        assert(padding != null),
        assert(decoration != null);

  @JsonKey(defaultValue: EufemiaButtonStyle.defaultTransitionDuration)
  @override
  final Duration duration;
  @override
  final EufemiaButtonState<double> opacity;
  @override
  final EufemiaButtonState<TextStyle> textStyle;
  @override
  final EufemiaButtonState<IconThemeData> iconTheme;
  @override
  final EufemiaButtonState<EdgeInsets> padding;
  @override
  final EufemiaButtonState<BoxDecoration> decoration;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EufemiaButtonStyle(duration: $duration, opacity: $opacity, textStyle: $textStyle, iconTheme: $iconTheme, padding: $padding, decoration: $decoration)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EufemiaButtonStyle'))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('opacity', opacity))
      ..add(DiagnosticsProperty('textStyle', textStyle))
      ..add(DiagnosticsProperty('iconTheme', iconTheme))
      ..add(DiagnosticsProperty('padding', padding))
      ..add(DiagnosticsProperty('decoration', decoration));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EufemiaButtonStyle &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.opacity, opacity) ||
                const DeepCollectionEquality()
                    .equals(other.opacity, opacity)) &&
            (identical(other.textStyle, textStyle) ||
                const DeepCollectionEquality()
                    .equals(other.textStyle, textStyle)) &&
            (identical(other.iconTheme, iconTheme) ||
                const DeepCollectionEquality()
                    .equals(other.iconTheme, iconTheme)) &&
            (identical(other.padding, padding) ||
                const DeepCollectionEquality()
                    .equals(other.padding, padding)) &&
            (identical(other.decoration, decoration) ||
                const DeepCollectionEquality()
                    .equals(other.decoration, decoration)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(opacity) ^
      const DeepCollectionEquality().hash(textStyle) ^
      const DeepCollectionEquality().hash(iconTheme) ^
      const DeepCollectionEquality().hash(padding) ^
      const DeepCollectionEquality().hash(decoration);

  @override
  _$EufemiaButtonStyleCopyWith<_EufemiaButtonStyle> get copyWith =>
      __$EufemiaButtonStyleCopyWithImpl<_EufemiaButtonStyle>(this, _$identity);
}

abstract class _EufemiaButtonStyle implements EufemiaButtonStyle {
  const factory _EufemiaButtonStyle(
          {Duration duration,
          @required EufemiaButtonState<double> opacity,
          @required EufemiaButtonState<TextStyle> textStyle,
          @required EufemiaButtonState<IconThemeData> iconTheme,
          @required EufemiaButtonState<EdgeInsets> padding,
          @required EufemiaButtonState<BoxDecoration> decoration}) =
      _$_EufemiaButtonStyle;

  @override
  Duration get duration;
  @override
  EufemiaButtonState<double> get opacity;
  @override
  EufemiaButtonState<TextStyle> get textStyle;
  @override
  EufemiaButtonState<IconThemeData> get iconTheme;
  @override
  EufemiaButtonState<EdgeInsets> get padding;
  @override
  EufemiaButtonState<BoxDecoration> get decoration;
  @override
  _$EufemiaButtonStyleCopyWith<_EufemiaButtonStyle> get copyWith;
}
