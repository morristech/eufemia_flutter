import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CheckboxView extends StatefulWidget {
  @override
  _CheckboxViewState createState() => _CheckboxViewState();
}

class _CheckboxViewState extends State<CheckboxView> {
  bool value1 = false;
  bool value2 = true;
  bool value3 = true;
  bool value4 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EufemiaAppBars.standard(
        title: 'Checkboxes',
        onBackPressed: () => Navigator.pop(context),
      ),
      body: EufemiaListView(
        alignment: Alignment.centerLeft,
        backgroundColor: EufemiaColors.white,
        padding: const EdgeInsets.all(8.0),
        children: [
          buildCheckboxSample(
            EufemiaCheckbox(
              value: value1,
              label: 'Checkbox',
              onValueChanged: (value) => setState(() => value1 = value),
            ),
          ),
          buildCheckboxSample(
            EufemiaCheckbox(
              value: value2,
              label: 'Label on left side',
              labelPosition: Position.left,
              onValueChanged: (value) => setState(() => value2 = value),
            ),
          ),
          buildCheckboxSample(
            EufemiaCheckbox(
              status: Status.error,
              errorChip: EufemiaChips.error(
                text: 'Error message',
              ),
              value: value3,
              label: 'Checkbox with error',
              errorForegroundColor: EufemiaColors.cherryRed,
              onValueChanged: (value) => setState(() => value3 = value),
            ),
          ),
          buildCheckboxSample(
            EufemiaCheckbox(
              value: value2,
              label: 'Disabled Checkbox',
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCheckboxSample(Widget child) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: child,
    );
  }
}
