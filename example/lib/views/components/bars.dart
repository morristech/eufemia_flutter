import 'package:eufemia/eufemia.dart';
import 'package:eufemia/eufemia.dart' as eufemia;
import 'package:flutter/material.dart';

class BarsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bars'),
      ),
      body: ScrollableList(
        children: [
          Toolbar(
            children: [
              Icon(Icons.edit),
            ],
          ),
          Toolbar(
            children: [
              Icon(Icons.settings),
              Icon(Icons.edit),
            ],
          ),
          Toolbar(
            children: [
              Icon(Icons.settings),
              Icon(Icons.info_outline),
              Icon(Icons.edit),
            ],
          ),
          Toolbar(
            children: [
              Icon(Icons.settings),
              Icon(Icons.info_outline),
              Icon(Icons.file_download),
              Icon(Icons.edit),
            ],
          ),
          Toolbar(
            children: [
              Icon(Icons.settings),
              Icon(Icons.info_outline),
              Icon(Icons.filter_list),
              Icon(Icons.file_download),
              Icon(Icons.edit),
            ],
          ),
          eufemia.BottomNavBar(
            items: <Widget>[
              Text('Y'),
              Text('Y'),
            ],
          )
        ],
      ),
    );
  }
}
