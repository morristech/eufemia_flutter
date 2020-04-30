import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class InputFieldsView extends StatefulWidget {
  @override
  _InputFieldsViewState createState() => _InputFieldsViewState();
}

class _InputFieldsViewState extends State<InputFieldsView> {
  TextEditingController _searchController;
  TextEditingController _inputController;
  TextEditingController _multilineController;
  TextEditingController _multilineCounterController;

  TextEditingController _formController;
  GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _inputController = TextEditingController();
    _multilineController = TextEditingController();
    _multilineCounterController = TextEditingController();
    _formController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Input fields'),
        leading: IconButton(
          icon: Icon(EufemiaIcons.back_arrow),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ScrollableList(
            showBorders: false,
            topPadding: true,
            children: [
              StaticList(
                title: 'Search bar',
                children: [
                  Material(
                    color: palette.primary,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SearchField(
                        controller: _searchController,
                      ),
                    ),
                  ),
                ],
              ),
              StaticList(
                topPadding: true,
                title: 'Input field',
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InputField(
                      controller: _inputController,
                      hintText: 'Input hint',
                    ),
                  ),
                ],
              ),
              StaticList(
                topPadding: true,
                title: 'Input field with validation',
                children: [
                  EufemiaRow(
                    spaceBetween: EufemiaSpace.medium,
                    padding: EufemiaInsets.medium(),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: InputField(
                          validator: (String value) => value.isEmpty
                              ? 'Something didn\'t validate here'
                              : null,
                          controller: _formController,
                          hintText: 'Input hint',
                        ),
                      ),
                      PrimaryButton(
                        child: Text('Validate'),
                        onTap: () => _formKey.currentState.validate(),
                      ),
                    ],
                  ),
                ],
              ),
              StaticList(
                topPadding: true,
                title: 'Multiline field',
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InputField(
                      controller: _multilineController,
                      maxLines: 5,
                      maxLength: 200,
                      multiline: true,
                      counter: false,
                      hintText:
                          'Input hint for longer texts that may or may not contain a character count.',
                    ),
                  ),
                ],
              ),
              StaticList(
                topPadding: true,
                title: 'Multiline field with counter',
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InputField(
                      controller: _multilineCounterController,
                      maxLines: 5,
                      maxLength: 200,
                      multiline: true,
                      hintText:
                          'Input hint for longer texts that may or may not contain a character count.',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
