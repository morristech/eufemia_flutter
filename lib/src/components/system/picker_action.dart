/// {@category Components}
/// {@subCategory System}
/// An action to be used with a picker component.
class PickerAction {
  /// The label to display on the action.
  final String label;

  /// If this action is the currently selected action.
  final bool selected;

  PickerAction({
    this.label,
    this.selected = false,
  });
}
