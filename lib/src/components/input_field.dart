import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final Function(String) validator;

  const InputField({
    Key key,
    this.focusNode,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField();
  }
}
