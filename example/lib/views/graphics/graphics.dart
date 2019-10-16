import 'package:eufemia_example/routes.dart';
import 'package:flutter/material.dart';

class GraphicsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Graphics'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        children: [
          ListTile(
            title: Text('Logos'),
            onTap: () => Navigator.pushNamed(context, Routes.logos),
          ),
          ListTile(
            title: Text('Flags'),
            onTap: () => Navigator.pushNamed(context, Routes.flags),
          ),
          ListTile(
            title: Text('Cards'),
            onTap: () => Navigator.pushNamed(context, Routes.graphics_cards),
          ),
        ],
      ),
    );
  }
}
