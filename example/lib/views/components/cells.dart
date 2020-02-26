import 'package:eufemia/eufemia.dart';
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
        leading: IconButton(
          icon: Icon(EufemiaIcons.back_arrow),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ScrollableList(
        topPadding: false,
        children: [
          Cell(
            title: Text('Master cell'),
            implyNavigation: true,
            actions: [
              CellAction(
                label: 'Label',
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                color: Colors.red,
                onTap: () => Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Tapped'),
                  ),
                ),
              ),
            ],
          ),
          Cell(
            leading: Column(
              children: [
                Text(
                  'Man',
                  style: TextStyle(
                    fontSize: 11,
                    color: context.bright ? EufemiaColors.coal : null,
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
                  child: Text(
                    '-888,00',
                  ),
                ),
              ],
            ),
            implyNavigation: true,
            actions: [
              CellAction(
                label: 'Label',
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                color: EufemiaColors.seaGreenAlt,
                onTap: () => Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Tapped'),
                  ),
                ),
              ),
              CellAction(
                label: 'Label 2',
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                color: EufemiaColors.emeraldGreen,
                onTap: () => Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Tapped'),
                  ),
                ),
              ),
            ],
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
            trailing: EufemiaSwitch(
              value: value,
              onChanged: (value) => setState(() => this.value = value),
            ),
          ),
          Material(
            color: EufemiaColors.accentYellow,
            child: Cell(
              title: Text(
                'Cells can also be used as labels containing information that spans over multiple lines',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
