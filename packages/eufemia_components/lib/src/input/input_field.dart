import 'package:eufemia_components/eufemia_components.dart';
import 'package:eufemia_palette/eufemia_palette.dart';
import 'package:eufemia_spacing/eufemia_spacing.dart';
import 'package:eufemia_typography/eufemia_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum InputState {
  empty,
  active,
  error,
}

class InputField extends StatefulWidget {
  final int maxLines;
  final int maxLength;
  final bool multiline;
  final bool autocorrect;
  final bool readOnly;
  final bool expands;
  final bool counter;
  final bool obscureText;
  final bool autovalidate;
  final bool autofocus;
  final bool enableSuggestions;
  final String errorText;
  final String hintText;
  final String label;
  final VoidCallback onEditingComplete;
  final VoidCallback onTap;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Function(String) validator;
  final Function(String) onChanged;
  final Function(String) onFieldSubmitted;
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
          buildCounter: buildCounter,
          focusNode: widget.focusNode,
          enableSuggestions: widget.enableSuggestions,
          onTap: widget.onTap,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: widget.onFieldSubmitted,
          decoration: InputDecoration(
            enabledBorder: buildBorder(context, InputState.empty),
            focusedBorder: buildBorder(context, InputState.active),
            errorBorder: buildBorder(context, InputState.error),
            focusedErrorBorder: buildBorder(context, InputState.error),
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

  Widget buildCounter(
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

  InputBorder buildBorder(BuildContext context, InputState state) {
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
