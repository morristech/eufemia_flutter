import 'package:eufemia/eufemia.dart';
import 'package:eufemia_example/routes.dart';
import 'package:flutter/material.dart';

class GraphicsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Graphics'),
        leading: IconButton(
          icon: Icon(EufemiaIcons.back_arrow),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ScrollableList(
        children: [
          Cell(
            title: Text('Logos'),
            onTap: () => Navigator.pushNamed(context, Routes.logos),
            implyNavigation: true,
          ),
          Cell(
            title: Text('Flags'),
            onTap: () => Navigator.pushNamed(context, Routes.flags),
            implyNavigation: true,
          ),
          Cell(
            title: Text('Cards'),
            onTap: () => Navigator.pushNamed(context, Routes.graphics_cards),
            implyNavigation: true,
          ),
        ],
      ),
    );
  }
}
