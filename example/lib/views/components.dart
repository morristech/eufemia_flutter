import 'package:eufemia_example/routes.dart';
import 'package:flutter/material.dart';

class ComponentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Search bar'),
            onTap: () => Navigator.pushNamed(context, Routes.search_bars),
          ),
          ListTile(
            title: Text('Cards'),
            onTap: () => Navigator.pushNamed(context, Routes.cards),
          ),
          ListTile(
            title: Text('Controls'),
            onTap: () => Navigator.pushNamed(context, Routes.controls),
          ),
          ListTile(
            title: Text('Toasts & Snackbars'),
            onTap: () => Navigator.pushNamed(context, Routes.snackbars),
          ),
          ListTile(
            title: Text('Cells'),
            onTap: () => Navigator.pushNamed(context, Routes.cells),
          ),
        ],
      ),
    );
  }
}
