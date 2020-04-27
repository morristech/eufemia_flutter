import 'package:eufemia/eufemia.dart';
import 'package:eufemia_example/routes.dart';
import 'package:flutter/material.dart';

class ComponentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
        leading: IconButton(
          icon: Icon(EufemiaIcons.back_arrow),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ScrollableList(
        children: [
          Cell(
            title: Text('Input fields'),
            onTap: () => Navigator.pushNamed(context, Routes.input_fields),
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
            title: Text('Spinner'),
            onTap: () => Navigator.pushNamed(context, Routes.spinner),
            implyNavigation: true,
          ),
          Cell(
            title: Text('Message boxes'),
            onTap: () => Navigator.pushNamed(context, Routes.messageBoxes),
            implyNavigation: true,
          ),
        ],
      ),
    );
  }
}
