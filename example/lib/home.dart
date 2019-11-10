import 'package:eufemia/eufemia.dart';
import 'package:eufemia_example/routes.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eufemia'),
      ),
      body: ScrollableList(
        children: [
          Cell(
            title: Text('Buttons'),
            onTap: () => Navigator.pushNamed(context, Routes.buttons),
            implyNavigation: true,
          ),
          Cell(
            title: Text('Components'),
            onTap: () => Navigator.pushNamed(context, Routes.components),
            implyNavigation: true,
          ),
          Cell(
            title: Text('Graphics'),
            onTap: () => Navigator.pushNamed(context, Routes.graphics),
            implyNavigation: true,
          ),
          Cell(
            title: Text('Icons'),
            onTap: () => Navigator.pushNamed(context, Routes.icons),
            implyNavigation: true,
          ),
          Cell(
            title: Text('System'),
            onTap: () => Navigator.pushNamed(context, Routes.system),
            implyNavigation: true,
          ),
        ],
      ),
    );
  }
}
