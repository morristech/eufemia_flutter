import 'package:flutter/material.dart';

/// {@category Components}
/// {@subCategory Buttons}
/// A generic button state class used to provide different values for different
/// states of an [EufemiaButton]
class EufemiaButtonState<T> {
  /// Values for when the button is in an enabled state
  final T enabled;

  /// Values for when the button is in a disabled state
  final T disabled;

  /// Values for when the button is in a hover state (e.g. mouse hover)
  final T hover;

  /// Values for when the button is in a focused state
  final T focus;

  /// Values for when the button is in an active state
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
