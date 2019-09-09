import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class RadioView extends StatefulWidget {
  @override
  _RadioViewState createState() => _RadioViewState();
}

class _RadioViewState extends State<RadioView> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int value1 = 1;
  int value2 = 2;
  int value3 = 3;

  int value4 = 4;
  int value5 = 5;
  int value6 = 6;

  int value7 = 7;
  int value8 = 8;
  int value9 = 9;

  int selectedValue1;
  int selectedValue2;
  int selectedValue3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: EufemiaAppBars.standard(
        title: 'Radio',
        onBackPressed: () => Navigator.pop(context),
      ),
      body: EufemiaListView(
        spacing: 16.0,
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.centerLeft,
        children: [
          EufemiaRadioGroup(
            label: 'Radio group:',
            value: selectedValue1,
            onChanged: (value) {
              setState(() => selectedValue1 = value);
              _scaffoldKey.currentState.hideCurrentSnackBar();
              _scaffoldKey.currentState.showSnackBar(
                SnackBar(
                  content: Text('$value selected!'),
                ),
              );
            },
            radios: [
              EufemiaRadio(
                value: value1,
                label: 'First',
              ),
              EufemiaRadio(
                value: value2,
                label: 'Second',
              ),
              EufemiaRadio(
                value: value3,
                label: 'Third',
              )
            ],
          ),
          EufemiaRadioGroup(
            label: 'Vertical group:',
            value: selectedValue2,
            direction: Axis.vertical,
            onChanged: (value) {
              setState(() => selectedValue2 = value);
              _scaffoldKey.currentState.hideCurrentSnackBar();
              _scaffoldKey.currentState.showSnackBar(
                SnackBar(
                  content: Text('$value selected!'),
                ),
              );
            },
            radios: [
              EufemiaRadio(
                value: value1,
                label: 'First',
              ),
              EufemiaRadio(
                value: value2,
                label: 'Second',
              ),
              EufemiaRadio(
                value: value3,
                label: 'Third',
              )
            ],
          ),
          EufemiaRadioGroup(
            label: 'With status:',
            value: selectedValue3,
            direction: Axis.vertical,
            onChanged: (value) {
              setState(() => selectedValue3 = value);
              _scaffoldKey.currentState.hideCurrentSnackBar();
              _scaffoldKey.currentState.showSnackBar(
                SnackBar(
                  backgroundColor:
                      value == 7 || value == 8 ? EufemiaColors.cherryRed : null,
                  content: Text('$value selected!'),
                ),
              );
            },
            radios: [
              EufemiaRadio(
                value: value7,
                label: 'First',
                status: Status.error,
              ),
              EufemiaRadio(
                value: value8,
                label: 'Second',
                status: Status.error,
                errorChip: EufemiaChips.error(text: 'Error message'),
              ),
              EufemiaRadio(
                value: value9,
                label: 'Third',
                status: Status.info,
                infoChip: EufemiaChips.info(text: 'Info message'),
              )
            ],
          ),
          EufemiaRadioGroup(
            label: 'Disabled group:',
            value: selectedValue1,
            radios: [
              EufemiaRadio(
                value: value1,
                label: 'First',
                labelPosition: Position.left,
              ),
              EufemiaRadio(
                value: value2,
                label: 'Second',
                labelPosition: Position.left,
              ),
              EufemiaRadio(
                value: value3,
                label: 'Third',
                labelPosition: Position.left,
              )
            ],
          ),
        ],
      ),
    );
  }
}
