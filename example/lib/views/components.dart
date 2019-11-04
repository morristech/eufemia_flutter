import 'package:eufemia/eufemia.dart';
import 'package:eufemia_example/routes.dart';
import 'package:flutter/material.dart';

class ComponentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: ScrollableList(
        children: [
          Cell(
            title: Text('Search bar'),
            onTap: () => Navigator.pushNamed(context, Routes.search_bars),
            implyNavigation: true,
          ),
          Cell(
            title: Text('Cards'),
            onTap: () => Navigator.pushNamed(context, Routes.cards),
            implyNavigation: true,
          ),
          Cell(
            title: Text('Controls'),
            onTap: () => Navigator.pushNamed(context, Routes.controls),
            implyNavigation: true,
          ),
          Cell(
            title: Text('Toasts & Snackbars'),
            onTap: () => Navigator.pushNamed(context, Routes.snackbars),
            implyNavigation: true,
          ),
          Cell(
            title: Text('Cells'),
            onTap: () => Navigator.pushNamed(context, Routes.cells),
            implyNavigation: true,
          ),
          Cell(
            title: Text('Bars'),
            onTap: () => Navigator.pushNamed(context, Routes.bars),
            implyNavigation: true,
          ),
          Cell(
            title: Text('Icons'),
            onTap: () => Navigator.pushNamed(context, Routes.icons),
            implyNavigation: true,
          ),
        ],
      ),
    );
  }
}
