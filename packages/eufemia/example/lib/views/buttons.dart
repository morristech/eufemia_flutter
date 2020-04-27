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
              child: Text('New primary'),
              onTap: () {},
            ),
            SecondaryButton(
              child: Text('New secondary'),
              onTap: () {},
            ),
            EufemiaButton(
              child: Text('New vivid'),
              onTap: () {},
              style: EufemiaButtonStyle.vivid(),
            ),
            TextButton(
              child: Text('Large emphasized'),
              size: EufemiaButtonSize.medium,
              onTap: () => {},
              emphasized: true,
            ),
            TextButton(
              child: Text('Large emphasized disabled'),
              size: EufemiaButtonSize.medium,
              emphasized: true,
            ),
            TextButton(
              child: Text('Large'),
              size: EufemiaButtonSize.medium,
              onTap: () => {},
            ),
            TextButton(
              child: Text('Large disabled'),
              size: EufemiaButtonSize.medium,
            ),
            TextButton(
              child: Text('Small emphasized'),
              size: EufemiaButtonSize.small,
              onTap: () => {},
              emphasized: true,
            ),
            TextButton(
              child: Text('Small emphasized disabled'),
              size: EufemiaButtonSize.small,
              emphasized: true,
            ),
            TextButton(
              child: Text('Small'),
              size: EufemiaButtonSize.small,
              onTap: () => {},
            ),
            TextButton(
              child: Text('Small disabled'),
              size: EufemiaButtonSize.small,
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
