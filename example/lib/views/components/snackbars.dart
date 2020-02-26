import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';
import 'package:snack/snack.dart';

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
                onTap: () => Snacks.bar(title: '').show(context),
              ),
              Cell(
                title: Text('With message'),
                onTap: () => Snacks.bar(title: 'Message').show(context),
              ),
              Cell(
                title: Text('Persistent'),
                onTap: () => Snacks.bar(
                  title: 'Persistent',
                  duration: Duration(days: 365),
                ).show(context),
              ),
              Cell(
                title: Text('With loading indicator'),
                onTap: () =>
                    Snacks.bar(title: 'Loading indicator', leading: Spinner())
                        .show(context),
              ),
              Cell(
                title: Text('With action'),
                onTap: () => Snacks.bar(
                  title: 'With action',
                  actionLabel: 'Hide',
                  onPressed: () => context.hideSnack(),
                  duration: Duration(days: 1),
                ).show(context),
              )
            ],
          );
        },
      ),
    );
  }
}
