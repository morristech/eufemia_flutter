import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class SnackbarsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Snackbars & Toasts'),
        ),
        body: Builder(
          builder: (context) {
            return ListView(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              children: [
                TextButton(
                  text: 'Empty snackbar',
                  size: ButtonSize.small,
                  onTap: () => Scaffold.of(context).showSnackBar(
                    Snacks.buildSnackBar(),
                  ),
                ),
                TextButton(
                  text: 'With message',
                  size: ButtonSize.small,
                  onTap: () => Scaffold.of(context).showSnackBar(
                    Snacks.buildSnackBar(
                      label: 'Message that persists until nav',
                      actionLabel: 'Hide',
                      onActionPressed: Scaffold.of(context).hideCurrentSnackBar,
                    ),
                  ),
                ),
                TextButton(
                  text: 'Empty snackbar',
                  size: ButtonSize.small,
                  onTap: () => Scaffold.of(context).showSnackBar(
                    Snacks.buildSnackBar(onActionPressed: () {}),
                  ),
                ),
                TextButton(
                  text: 'Empty snackbar',
                  size: ButtonSize.small,
                  onTap: () => Scaffold.of(context).showSnackBar(
                    Snacks.buildSnackBar(onActionPressed: () {}),
                  ),
                )
              ],
            );
          },
        ));
  }
}
