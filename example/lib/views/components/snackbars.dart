import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class SnackbarsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snackbars & Toasts'),
        leading: IconButton(
          icon: Icon(EufemiaIcons.back_arrow),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Builder(
        builder: (context) {
          return ScrollableList(
            children: [
              Cell(
                title: Text('Empty snackbar'),
              ),
              Cell(
                title: Text('With message'),
              ),
              Cell(
                title: Text('Persistent'),
              ),
              Cell(
                title: Text('With loading indicator'),
              )
            ],
          );
        },
      ),
    );
  }
}
