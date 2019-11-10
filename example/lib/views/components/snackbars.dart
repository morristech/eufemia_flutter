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
                onTap: () => Scaffold.of(context).showSnackBar(
                  Snacks.buildSnackBar(),
                ),
              ),
              Cell(
                title: Text('With message'),
                onTap: () => Scaffold.of(context).showSnackBar(
                  Snacks.buildSnackBar(
                    label: 'Message',
                    actionLabel: 'Hide',
                    onActionPressed: Scaffold.of(context).hideCurrentSnackBar,
                  ),
                ),
              ),
              Cell(
                title: Text('Persistent'),
                onTap: () => Scaffold.of(context).showSnackBar(
                  Snacks.buildSnackBar(
                    onActionPressed: Scaffold.of(context).hideCurrentSnackBar,
                    label: 'This persists until dismissed',
                    actionLabel: 'Hide',
                    persist: true,
                  ),
                ),
              ),
              Cell(
                title: Text('With loading indicator'),
                onTap: () => Scaffold.of(context).showSnackBar(
                  Snacks.buildSnackBar(
                    onActionPressed: Scaffold.of(context).hideCurrentSnackBar,
                    showProgressIndicator: true,
                    label: 'Loading...',
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
