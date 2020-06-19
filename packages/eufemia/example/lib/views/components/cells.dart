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
    final palette = EufemiaPalette.of(context);

    return Scaffold(
      appBar: Navbar(
        title: Text('Cells'),
      ),
      body: ScrollableList(
        children: [
          Cell(
            title: Text('Master cell'),
            implyNavigation: true,
            actions: [
              CellAction(
                label: 'Label',
                icon: Icon(
                  EufemiaIcons.review_warning,
                  color: palette.onError,
                ),
                color: palette.error,
                onTap: () => Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Tapped'),
                  ),
                ),
              ),
            ],
          ),
          Cell(
            leading: EufemiaColumn(
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
            trailing: EufemiaRow(
              children: [
                EufemiaPadding(
                  padding: EufemiaInsets.small(EufemiaSides.right),
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
                  EufemiaIcons.remove,
                  color: palette.onInfo,
                ),
                color: palette.info,
                onTap: () => Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Tapped'),
                  ),
                ),
              ),
              CellAction(
                label: 'Label 2',
                icon: Icon(
                  EufemiaIcons.add,
                  color: palette.onWarning,
                ),
                color: palette.warning,
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
              shrink: true,
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
