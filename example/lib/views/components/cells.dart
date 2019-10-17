import 'package:eufemia/eufemia.dart';
import 'package:eufemia/eufemia.dart' as eufemia;
import 'package:flutter/material.dart';

class CellsView extends StatefulWidget {
  @override
  _CellsViewState createState() => _CellsViewState();
}

class _CellsViewState extends State<CellsView> {
  bool value;

  @override
  void initState() {
    super.initState();
    value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cells'),
      ),
      body: ScrollableList(
        children: [
          Cell(
            title: Text('Master cell'),
            trailing: Icon(Icons.chevron_right),
          ),
          Cell(
            leading: Column(
              children: [
                Text(
                  'Man',
                  style: TextStyle(
                    fontSize: 11,
                    color: EufemiaColors.coal,
                  ),
                ),
                Text('88'),
              ],
            ),
            title: Text('Recipient/Sender'),
            trailing: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text('-888 888,00'),
                ),
                Icon(Icons.chevron_right),
              ],
            ),
          ),
          Cell(
            leading: Icon(Icons.check),
            title: Text('Icon and label'),
          ),
          Cell(
            title: Text('Label with detail'),
            subtitle: Text('Detail goes here'),
          ),
          Cell(
            title: Text('Label with switch'),
            trailing: eufemia.Switch(
              value: true,
              onChanged: (value) => setState(() => this.value = value),
            ),
          ),
        ],
      ),
    );
  }
}
