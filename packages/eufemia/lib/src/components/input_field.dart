import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final Function(String) validator;
  final Function(String) onChanged;
  final String hint;
  final String errorText;
  final TextInputType keyboardType;
  final int minLines;
  final int maxLength;
  final int maxLines;
  final bool multiLine;

  const InputField({
    Key key,
    this.focusNode,
    this.controller,
    this.validator,
    this.onChanged,
    this.hint = 'Hint',
    this.keyboardType,
    this.minLines,
    this.maxLength,
    this.maxLines = 1,
    this.multiLine = false,
    this.errorText = 'Error',
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextFormField(
        focusNode: widget.focusNode,
        expands: widget.multiLine &&
            widget.maxLines == null &&
            widget.minLines == null,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        controller: widget.controller,
        keyboardType:
            widget.multiLine ? TextInputType.multiline : widget.keyboardType,
        validator: widget.validator ?? _defaultValidator,
        onChanged: (String value) {
          // Needed to update the border color/size
          setState(() {});

          if (widget.onChanged != null) {
            widget.onChanged(value);
          }
        },
        style: TextStyle(
          color: context.bright ? EufemiaColors.coal : Colors.white,
          fontSize: 17.0,
        ),
        decoration: InputDecoration(
          hintText: widget.hint,
          enabledBorder: widget.controller.text.isEmpty
              ? context.theme.inputDecorationTheme.enabledBorder
              : EufemiaTheme.unfocusedWithTextBorder(context),
        ),
      ),
    );
  }

  String _defaultValidator(String value) {
    if (value.isEmpty) {
      return 'Wrong';
    }
    return null;
  }
}
