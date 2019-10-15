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
            label: 'Large',
            size: ButtonSize.large,
            onTap: () => {},
          ),
          PrimaryButton(
            label: 'Large disabled',
            size: ButtonSize.large,
          ),
          PrimaryButton(
            label: 'Small',
            size: ButtonSize.small,
            onTap: () => {},
          ),
          PrimaryButton(
            label: 'Small disabled',
            size: ButtonSize.small,
          ),
          SecondaryButton(
            label: 'Large',
            size: ButtonSize.large,
            onTap: () => {},
          ),
          SecondaryButton(
            label: 'Large disabled',
            size: ButtonSize.large,
          ),
          SecondaryButton(
            label: 'Small',
            size: ButtonSize.small,
            onTap: () => {},
          ),
          SecondaryButton(
            label: 'Small disabled',
            size: ButtonSize.small,
          ),
          VividButton(
            label: 'Large',
            size: ButtonSize.large,
            onTap: () => {},
          ),
          VividButton(
            label: 'Large disabled',
            size: ButtonSize.large,
          ),
          VividButton(
            label: 'Small',
            size: ButtonSize.small,
            onTap: () => {},
          ),
          VividButton(
            label: 'Small disabled',
            size: ButtonSize.small,
          ),
          TextButton(
            label: 'Large emphasized',
            size: ButtonSize.large,
            onTap: () => {},
            emphasized: true,
          ),
          TextButton(
            label: 'Large emphasized disabled',
            size: ButtonSize.large,
            emphasized: true,
          ),
          TextButton(
            label: 'Large',
            size: ButtonSize.large,
            onTap: () => {},
          ),
          TextButton(
            label: 'Large disabled',
            size: ButtonSize.large,
          ),
          TextButton(
            label: 'Small emphasized',
            size: ButtonSize.small,
            onTap: () => {},
            emphasized: true,
          ),
          TextButton(
            label: 'Small emphasized disabled',
            size: ButtonSize.small,
            emphasized: true,
          ),
          TextButton(
            label: 'Small',
            size: ButtonSize.small,
            onTap: () => {},
          ),
          TextButton(
            label: 'Small disabled',
            size: ButtonSize.small,
          ),
          FAB(
            child: Icon(Icons.add),
            onTap: () => {},
          ),
          FAB(
            child: Icon(Icons.add),
            onTap: () => {},
            enabled: false,
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
