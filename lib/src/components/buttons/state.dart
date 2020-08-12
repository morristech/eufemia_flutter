import 'package:flutter/material.dart';

class EufemiaButtonState<T> {
  final T enabled;
  final T disabled;
  final T hover;
  final T focus;
  final T active;

  const EufemiaButtonState({
    @required this.enabled,
    T disabled,
    T hover,
    T active,
    T focus,
  })  : disabled = disabled ?? enabled,
        active = active ?? enabled,
        hover = hover ?? (active ?? enabled),
        focus = focus ?? (hover ?? (active ?? enabled));

  T value({
    bool isDisabled,
    bool isActive,
    bool isHover,
    bool isFocused,
  }) {
    if (isDisabled == true) return disabled;
    if (isActive == true) return active;
    if (isHover == true) return hover;
    if (isFocused == true) return focus;
    return enabled;
  }
}
