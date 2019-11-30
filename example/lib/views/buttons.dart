import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class ButtonsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons'),
        leading: IconButton(
          icon: Icon(EufemiaIcons.back_arrow),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: ScrollableList(
          showBorders: false,
          children: [
            PrimaryButton(
              label: 'Large',
              size: ButtonSize.large,
              onPressed: () => {},
            ),
            PrimaryButton(
              label: 'Large disabled',
              size: ButtonSize.large,
              onPressed: null,
            ),
            PrimaryButton(
              label: 'Small',
              size: ButtonSize.small,
              onPressed: () => {},
            ),
            PrimaryButton(
              label: 'Small disabled',
              size: ButtonSize.small,
              onPressed: null,
            ),
            SecondaryButton(
              label: 'Large',
              size: ButtonSize.large,
              onPressed: () => {},
            ),
            SecondaryButton(
              label: 'Large disabled',
              size: ButtonSize.large,
              onPressed: null,
            ),
            SecondaryButton(
              label: 'Small',
              size: ButtonSize.small,
              onPressed: () => {},
            ),
            SecondaryButton(
              label: 'Small disabled',
              size: ButtonSize.small,
              onPressed: null,
            ),
            VividButton(
              label: 'Large',
              size: ButtonSize.large,
              onPressed: () => {},
            ),
            VividButton(
              label: 'Large disabled',
              size: ButtonSize.large,
              onPressed: null,
            ),
            VividButton(
              label: 'Small',
              size: ButtonSize.small,
              onPressed: () => {},
            ),
            VividButton(
              label: 'Small disabled',
              size: ButtonSize.small,
              onPressed: null,
            ),
            TextButton(
              label: 'Large emphasized',
              size: ButtonSize.large,
              onPressed: () => {},
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
              onPressed: () => {},
            ),
            TextButton(
              label: 'Large disabled',
              size: ButtonSize.large,
            ),
            TextButton(
              label: 'Small emphasized',
              size: ButtonSize.small,
              onPressed: () => {},
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
              onPressed: () => {},
            ),
            TextButton(
              label: 'Small disabled',
              size: ButtonSize.small,
            ),
            FAB(
              child: Icon(EufemiaIcons.close),
              onPressed: () => {},
            ),
            FAB(
              child: Icon(EufemiaIcons.close),
              onPressed: () => {},
              enabled: false,
            ),
          ]
              .map<Widget>(
                (widget) => Center(
                  child: Padding(
                    child: widget,
                    padding: const EdgeInsets.all(8.0),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
