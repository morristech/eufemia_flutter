import 'package:eufemia/eufemia.dart' as eufemia;
import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class ControlsView extends StatefulWidget {
  @override
  _ControlsViewState createState() => _ControlsViewState();
}

class _ControlsViewState extends State<ControlsView> {
  int _tabValue;
  bool _firstSwitchValue;
  bool _secondSwitchValue;
  double _sliderValue;
  RangeValues _rangeValues;
  bool _firstToggleValue;
  bool _secondToggleValue;

  @override
  void initState() {
    super.initState();
    _tabValue = 0;
    _firstSwitchValue = true;
    _secondSwitchValue = false;
    _sliderValue = 0.5;
    _rangeValues = RangeValues(0.4, 0.6);
    _firstToggleValue = true;
    _secondToggleValue = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controls'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              eufemia.Tab(
                label: 'Tab',
                active: _tabValue == 0,
                onSelected: () => _setTab(0),
              ),
              eufemia.Tab(
                label: 'Tab',
                active: _tabValue == 1,
                onSelected: () => _setTab(1),
              ),
              eufemia.Tab(
                label: 'Tab',
                active: _tabValue == 2,
                onSelected: () => _setTab(2),
              )
            ],
          ),
          Row(
            children: [
              eufemia.Switch(
                value: _firstSwitchValue,
                onChanged: (value) => setState(() => _firstSwitchValue = value),
              ),
              eufemia.Switch(
                value: _secondSwitchValue,
                onChanged: (value) => setState(() => _secondSwitchValue = value),
              ),
            ],
          ),
          eufemia.Slider(
            value: _sliderValue,
            onChanged: (value) => setState(() => _sliderValue = value),
          ),
          eufemia.RangeSlider(
            values: _rangeValues,
            onChanged: (values) => setState(() => _rangeValues = values),
            labelBuilder: (context, values) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${(values.start * 999).toStringAsPrecision(3)} kr til ${(values.end * 999).toStringAsPrecision(3)} kr',
                    ),
                    eufemia.TextButton(
                      label: 'Vis felter',
                      onPressed: () {},
                      size: eufemia.ButtonSize.small,
                    ),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Tag(
              label: '#tagname',
              onDelete: () {},
            ),
          ),
          Row(
            children: [
              ToggleLabel(
                label: 'Toggle label',
                selected: _firstToggleValue,
                onChange: (value) => setState(() => _firstToggleValue = value),
              ),
              ToggleLabel(
                label: 'Toggle label',
                selected: _secondToggleValue,
                onChange: (value) => setState(() => _secondToggleValue = value),
              )
            ]
                .map(
                  (i) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: i,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  void _setTab(int index) {
    setState(() => _tabValue = index);
  }
}
