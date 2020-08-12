import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class ButtonsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: Text('Buttons'),
      ),
      body: SafeArea(
        child: ScrollableList(
          spaceBetween: EufemiaSpace.medium,
          padding: EufemiaInsets.allMedium,
          showBorders: false,
          children: [
            EufemiaPrimaryButton(
              child: Text('Primary'),
              onTap: () {},
            ),
            EufemiaPrimaryButton(
              child: Text('Primary disabled'),
            ),
            EufemiaPrimaryButton(
              child: Text('Primary small'),
              size: EufemiaButtonSize.small,
              onTap: () {},
            ),
            EufemiaPrimaryButton(
              child: Text('Primary small disabled'),
              size: EufemiaButtonSize.small,
            ),
            EufemiaSecondaryButton(
              child: Text('Secondary'),
              onTap: () {},
            ),
            EufemiaSecondaryButton(
              child: Text('Secondary disabled'),
            ),
            EufemiaSecondaryButton(
              child: Text('Secondary small'),
              onTap: () {},
              size: EufemiaButtonSize.small,
            ),
            EufemiaSecondaryButton(
              child: Text('Secondary small disabled'),
              size: EufemiaButtonSize.small,
            ),
            EufemiaVividButton(
              child: Text('Vivid'),
              onTap: () {},
            ),
            EufemiaVividButton(
              child: Text('Vivid disabled'),
            ),
            EufemiaVividButton(
              child: Text('Vivid small'),
              size: EufemiaButtonSize.small,
              onTap: () {},
            ),
            EufemiaVividButton(
              child: Text('Vivid small disabled'),
              size: EufemiaButtonSize.small,
            ),
            EufemiaTextButton(
              child: Text('Large emphasized'),
              onTap: () => {},
              emphasized: true,
            ),
            EufemiaTextButton(
              child: Text('Large emphasized disabled'),
              emphasized: true,
            ),
            EufemiaTextButton(
              child: Text('Large'),
              onTap: () => {},
            ),
            EufemiaTextButton(
              child: Text('Large disabled'),
            ),
            EufemiaTextButton(
              child: Text('Small emphasized'),
              size: EufemiaButtonSize.small,
              onTap: () => {},
              emphasized: true,
            ),
            EufemiaTextButton(
              child: Text('Small emphasized disabled'),
              size: EufemiaButtonSize.small,
              emphasized: true,
            ),
            EufemiaTextButton(
              child: Text('Small'),
              size: EufemiaButtonSize.small,
              onTap: () => {},
            ),
            EufemiaTextButton(
              child: Text('Small disabled'),
              size: EufemiaButtonSize.small,
            ),
            EufemiaFloatingActionButton(
              child: Icon(EufemiaIcons.close),
              onTap: () {},
            ),
            EufemiaFloatingActionButton(
              child: Icon(EufemiaIcons.close),
            ),
          ],
        ),
      ),
    );
  }
}
