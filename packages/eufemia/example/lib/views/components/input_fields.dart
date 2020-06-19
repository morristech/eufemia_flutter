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
      appBar: Navbar(
        title: Text('Input fields'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: EufemiaPadding.medium(
            sides: EufemiaSides.top,
            child: ScrollableList(
              showBorders: false,
              spaceBetween: EufemiaSpace.medium,
              children: [
                StaticList(
                  title: Text('Search bar'),
                  children: [
                    Material(
                      color: palette.primary,
                      child: EufemiaPadding.medium(
                        child: SearchField(
                          controller: _searchController,
                        ),
                      ),
                    ),
                  ],
                ),
                StaticList(
                  title: Text('Input field'),
                  children: [
                    EufemiaPadding.medium(
                      child: InputField(
                        controller: _inputController,
                        hintText: 'Input hint',
                      ),
                    ),
                  ],
                ),
                StaticList(
                  title: Text('Input field with validation (empty)'),
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
                  title: Text('Multiline field'),
                  children: [
                    EufemiaPadding.medium(
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
                  title: Text('Multiline field with counter'),
                  children: [
                    EufemiaPadding.medium(
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
      ),
    );
  }
}
