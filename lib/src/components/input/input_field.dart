import 'package:eufemia/components.dart';
import 'package:eufemia/palette.dart';
import 'package:eufemia/spacing.dart';
import 'package:eufemia/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// {@category Components}
/// {@subCategory Input}
/// A state for an [InputField].
enum InputState {
  empty,
  active,
  error,
}

/// {@category Components}
/// {@subCategory Input}
/// An input field from the Eufemia design system.
class InputField extends StatefulWidget {
  /// The max amount of lines available.
  final int maxLines;

  /// The max length of the input string.
  final int maxLength;

  /// If this field should accept multiple lines of input.
  final bool multiline;

  /// If the system's autocorrect should be enabled for this field.
  final bool autocorrect;

  /// If this field should be read-only.
  final bool readOnly;

  /// If this field can expand.
  final bool expands;

  /// If this field should display a character counter.
  final bool counter;

  /// If the input text should be obscured.
  final bool obscureText;

  /// If this field should auto-validate itself on input.
  final bool autovalidate;

  /// If this field should receive focus automatically.
  final bool autofocus;

  /// If the system keyboard should enable suggestions for this field.
  final bool enableSuggestions;

  /// The text to display on validation errors.
  final String errorText;

  /// {@template eufemia.components.input.hintText}
  /// The hint text to display before the field is modified. Disappears once
  /// text is entered in the field.
  /// {@endtemplate}
  final String hintText;

  /// The label to display above the field. Will not go away once user starts
  /// to type.
  final String label;

  /// {@template eufemia.gestures.onEditingComplete}
  /// The callback function that is called when the field has been edited.
  /// {@endtemplate}
  final VoidCallback onEditingComplete;

  /// {@macro eufemia.gestures.onTap}
  final VoidCallback onTap;

  /// {@template eufemia.components.input.controller}
  /// The [TextEditingController] used control and modify this field.
  /// {@endtemplate}
  final TextEditingController controller;

  /// The type of keyboard to display when this field is tapped.
  final TextInputType keyboardType;

  /// The type of action to display on the system keyboard.
  final TextInputAction textInputAction;

  /// The validator function that is called on form validation. Should return
  /// the error text to display.
  final Function(String) validator;

  /// {@macro eufemia.gestures.onChanged}
  final Function(String) onChanged;

  /// {@template eufemia.gestures.onFieldSubmitted}
  /// The callback function that is called when the field has been submitted by
  /// the user pressing the keyboard's action button.
  /// {@endtemplate}
  final Function(String) onFieldSubmitted;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode focusNode;

  const InputField({
    Key key,
    this.controller,
    this.maxLines = 1,
    this.maxLength,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.errorText,
    this.keyboardType,
    this.autocorrect = true,
    this.readOnly = false,
    this.multiline = false,
    this.expands = false,
    this.counter = true,
    this.autovalidate = false,
    this.autofocus = false,
    this.hintText,
    this.label,
    this.obscureText = false,
    this.focusNode,
    this.enableSuggestions = true,
    this.onTap,
    this.textInputAction,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  GlobalKey<FormFieldState> fieldKey;

  @override
  void initState() {
    super.initState();
    fieldKey = GlobalKey<FormFieldState>();
    widget.controller.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    fieldKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);
    final typography = EufemiaTypography.of(context);
    final style = typography.styles.body.toTextStyle(context);

    return EufemiaColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.label != null) ...{
          Text(
            widget.label,
            style: typography.styles.bodyEmphasized.toTextStyle(context),
          ),
          EufemiaGap(EufemiaSpace.small),
        },
        TextFormField(
          key: fieldKey,
          onEditingComplete: widget.onEditingComplete,
          cursorColor: palette.secondary,
          controller: widget.controller,
          validator: widget.validator,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          onChanged: widget.onChanged,
          expands: widget.expands,
          autocorrect: widget.autocorrect,
          readOnly: widget.readOnly,
          autofocus: widget.autofocus,
          autovalidate: widget.autovalidate,
          style: style,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType ?? defaultKeyboard,
          buildCounter: _buildCounter,
          focusNode: widget.focusNode,
          enableSuggestions: widget.enableSuggestions,
          onTap: widget.onTap,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: widget.onFieldSubmitted,
          decoration: InputDecoration(
            enabledBorder: _buildBorder(context, InputState.empty),
            focusedBorder: _buildBorder(context, InputState.active),
            errorBorder: _buildBorder(context, InputState.error),
            focusedErrorBorder: _buildBorder(context, InputState.error),
            hintText: widget.hintText,
            hintStyle: style.copyWith(color: palette.grey),
            errorText: widget.errorText,
            errorStyle: typography.styles.subhead
                .copyWith(color: palette.error)
                .toTextStyle(context),
            suffixIcon: GestureDetector(
              onTap: widget.controller.clear,
              child: Icon(
                showIcon ? EufemiaIcons.clear : null,
                color: palette.grey,
                size: 16.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  bool get hasError => fieldKey.currentState?.hasError ?? false;
  bool get hasText => widget.controller.text.isNotEmpty;
  bool get showIcon => hasText && !widget.multiline;
  bool get multiline => widget.multiline;

  Widget _buildCounter(
    BuildContext context, {
    int currentLength,
    bool isFocused,
    int maxLength,
  }) {
    final palette = EufemiaPalette.of(context);
    final typography = EufemiaTypography.of(context);

    if (maxLength != null && widget.counter) {
      return Text(
        '$currentLength/$maxLength',
        style: typography.styles.footnote
            .copyWith(color: palette.grey)
            .toTextStyle(context),
      );
    }
    return null;
  }

  TextInputType get defaultKeyboard {
    if (multiline) {
      return TextInputType.multiline;
    } else {
      return TextInputType.text;
    }
  }

  InputBorder _buildBorder(BuildContext context, InputState state) {
    final palette = EufemiaPalette.of(context);
    final radius = BorderRadius.circular(4.0);
    var color;
    var width;

    switch (state) {
      case InputState.empty:
        color = hasText ? palette.secondary : palette.grey;
        width = .5;
        break;
      case InputState.active:
        color = palette.secondary;
        width = 1.5;
        break;
      case InputState.error:
        color = palette.error;
        width = .5;
        break;
    }

    return OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(
        width: width,
        color: color,
      ),
    );
  }
}
