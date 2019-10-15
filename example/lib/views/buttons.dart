import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class ButtonsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        children: [
          PrimaryButton(
            text: 'Large',
            size: ButtonSize.large,
            onTap: () => {},
          ),
          PrimaryButton(
            text: 'Large disabled',
            size: ButtonSize.large,
          ),
          PrimaryButton(
            text: 'Small',
            size: ButtonSize.small,
            onTap: () => {},
          ),
          PrimaryButton(
            text: 'Small disabled',
            size: ButtonSize.small,
          ),
          SecondaryButton(
            text: 'Large',
            size: ButtonSize.large,
            onTap: () => {},
          ),
          SecondaryButton(
            text: 'Large disabled',
            size: ButtonSize.large,
          ),
          SecondaryButton(
            text: 'Small',
            size: ButtonSize.small,
            onTap: () => {},
          ),
          SecondaryButton(
            text: 'Small disabled',
            size: ButtonSize.small,
          ),
          VividButton(
            text: 'Large',
            size: ButtonSize.large,
            onTap: () => {},
          ),
          VividButton(
            text: 'Large disabled',
            size: ButtonSize.large,
          ),
          VividButton(
            text: 'Small',
            size: ButtonSize.small,
            onTap: () => {},
          ),
          VividButton(
            text: 'Small disabled',
            size: ButtonSize.small,
          ),
          TextButton(
            text: 'Large emphasized',
            size: ButtonSize.large,
            onTap: () => {},
            emphasized: true,
          ),
          TextButton(
            text: 'Large emphasized disabled',
            size: ButtonSize.large,
            emphasized: true,
          ),
          TextButton(
            text: 'Large',
            size: ButtonSize.large,
            onTap: () => {},
          ),
          TextButton(
            text: 'Large disabled',
            size: ButtonSize.large,
          ),
          TextButton(
            text: 'Small emphasized',
            size: ButtonSize.small,
            onTap: () => {},
            emphasized: true,
          ),
          TextButton(
            text: 'Small emphasized disabled',
            size: ButtonSize.small,
            emphasized: true,
          ),
          TextButton(
            text: 'Small',
            size: ButtonSize.small,
            onTap: () => {},
          ),
          TextButton(
            text: 'Small disabled',
            size: ButtonSize.small,
          ),
          FAB(
            child: Icon(Icons.add),
            onTap: () => {},
          ),
          FAB(
            child: Icon(Icons.add),
          ),
        ]
            .map(
              (widget) => Padding(
                child: widget,
                padding: const EdgeInsets.all(8.0),
              ),
            )
            .toList(),
      ),
    );
  }
}
