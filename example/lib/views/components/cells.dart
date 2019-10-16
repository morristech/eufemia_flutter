import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class CellsView extends StatelessWidget {
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
        ],
      ),
    );
  }
}
