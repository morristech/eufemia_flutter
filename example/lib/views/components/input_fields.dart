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
  TextEditingController _formController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _inputController = TextEditingController();
    _multilineController = TextEditingController();
    _formController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input fields'),
        leading: IconButton(
          icon: Icon(EufemiaIcons.back_arrow),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: ScrollableList(
          showBorders: false,
          topPadding: true,
          children: [
            StaticList(
              title: 'Search bar',
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SearchBar(
                    controller: _searchController,
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
                  ),
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
                  ),
                ),
              ],
            ),
            StaticList(
              topPadding: true,
              title: 'Form field',
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InputField(
                    validator: (String value) {
                      return 'Error';
                    },
                    controller: _formController,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
