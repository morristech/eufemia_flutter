import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class ControlsView extends StatefulWidget {
  @override
  _ControlsViewState createState() => _ControlsViewState();
}

class _ControlsViewState extends State<ControlsView> {
  int firstTabValue;
  int secondTabValue;
  bool firstSwitchValue;
  bool secondSwitchValue;
  double sliderValue;
  bool firstToggleValue;
  bool secondToggleValue;

  @override
  void initState() {
    super.initState();
    firstTabValue = 0;
    secondTabValue = 0;
    firstSwitchValue = true;
    secondSwitchValue = false;
    sliderValue = 0.5;
    firstToggleValue = true;
    secondToggleValue = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: Text('Controls'),
      ),
      body: DefaultTabController(
        length: 3,
        child: ScrollableList(
          padding: EufemiaInsets.allMedium,
          spaceBetween: EufemiaSpace.medium,
          showBorders: false,
          children: [
            EufemiaTabBar(
              tabs: [
                EufemiaTab(
                  label: 'Søknad',
                  index: 0,
                ),
                EufemiaTab(
                  label: 'Tab',
                  index: 1,
                ),
                EufemiaTab(
                  label: 'Tab',
                  index: 2,
                )
              ],
            ),
            EufemiaRow(
              children: [
                EufemiaSwitch(
                  value: firstSwitchValue,
                  onChanged: (value) => setState(() => firstSwitchValue = value),
                ),
                EufemiaSwitch(
                  value: secondSwitchValue,
                  onChanged: (value) => setState(() => secondSwitchValue = value),
                ),
              ],
            ),
            EufemiaRow(
              children: [
                Checkmark(
                  value: firstToggleValue,
                  onChanged: (value) => setState(() => firstToggleValue = value),
                ),
                SizedBox(width: 8),
                Checkmark(
                  value: secondToggleValue,
                  onChanged: (value) => setState(() => secondToggleValue = value),
                ),
              ],
            ),
            EufemiaSlider(
              value: sliderValue,
              onChanged: (value) => setState(() => sliderValue = value),
            ),
            Tag(
              label: '#tagname',
              onDelete: () {},
            ),
            EufemiaRow(
              children: [
                Toggle(
                  label: 'Toggle label',
                  selected: firstToggleValue,
                  onChange: (value) => setState(() => firstToggleValue = value),
                ),
                Toggle(
                  label: 'Toggle label',
                  selected: secondToggleValue,
                  onChange: (value) => setState(() => secondToggleValue = value),
                )
              ],
            ),
            EufemiaRow(
              children: [
                PageIndicator(
                  count: 3,
                  controller: PageController(),
                ),
              ],
            ),
            SegmentedControl<int>(
              children: {
                0: 'Label',
                1: 'Label',
                2: 'Label',
              },
              onValueChanged: (value) => setState(() => firstTabValue = value),
              groupValue: firstTabValue,
            ),
            SegmentedControl<int>(
              children: {
                0: 'Label',
                1: 'Label',
              },
              onValueChanged: (value) => setState(() => secondTabValue = value),
              groupValue: secondTabValue,
            ),
          ],
        ),
      ),
    );
  }

  void setTab(int index) {
    setState(() => firstTabValue = index);
  }
}
