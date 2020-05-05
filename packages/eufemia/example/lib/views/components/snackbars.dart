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
                onTap: () => Snacks.bar(
                  title: SizedBox(
                    height: 16.0,
                  ),
                ).show(context),
              ),
              Cell(
                title: Text('With message'),
                onTap: () => Snacks.bar(
                  title: Text('Message'),
                ).show(context),
              ),
              Cell(
                title: Text('Persistent'),
                onTap: () => Snacks.bar(
                  title: Text('Persistent'),
                  duration: Duration(days: 1),
                ).show(context),
              ),
              Cell(
                title: Text('With spinner'),
                onTap: () => Snacks.bar(
                  title: Text('Loading indicator'),
                  leading: Spinner(),
                ).show(context),
              ),
              Cell(
                title: Text('With action'),
                onTap: () => Snacks.bar(
                  title: Text('With action'),
                  actionLabel: 'Hide',
                  onTap: () => context.hideSnack(),
                  duration: Duration(days: 1),
                ).show(context),
              ),
              Cell(
                title: Text('With action and spinner'),
                onTap: () => Snacks.bar(
                  title: Text('With action and spinner'),
                  actionLabel: 'Hide',
                  onTap: () => context.hideSnack(),
                  duration: Duration(days: 1),
                  leading: Spinner(),
                ).show(context),
              )
            ],
          );
        },
      ),
    );
  }
}
