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
          spaceBetween: EufemiaSpace.medium,
          showBorders: false,
          children: [
            PrimaryButton(
              child: Text('Primary'),
              onTap: () {},
            ),
            PrimaryButton(
              child: Text('Primary disabled'),
            ),
            PrimaryButton(
              child: Text('Primary small'),
              size: EufemiaButtonSize.small,
              onTap: () {},
            ),
            PrimaryButton(
              child: Text('Primary small disabled'),
              size: EufemiaButtonSize.small,
            ),
            SecondaryButton(
              child: Text('Secondary'),
              onTap: () {},
            ),
            SecondaryButton(
              child: Text('Secondary disabled'),
            ),
            SecondaryButton(
              child: Text('Secondary small'),
              onTap: () {},
              size: EufemiaButtonSize.small,
            ),
            SecondaryButton(
              child: Text('Secondary small disabled'),
              size: EufemiaButtonSize.small,
            ),
            VividButton(
              child: Text('Vivid'),
              onTap: () {},
            ),
            VividButton(
              child: Text('Vivid disabled'),
            ),
            VividButton(
              child: Text('Vivid small'),
              size: EufemiaButtonSize.small,
              onTap: () {},
            ),
            VividButton(
              child: Text('Vivid small disabled'),
              size: EufemiaButtonSize.small,
            ),
            TextButton(
              child: Text('Large emphasized'),
              onTap: () => {},
              emphasized: true,
            ),
            TextButton(
              child: Text('Large emphasized disabled'),
              emphasized: true,
            ),
            TextButton(
              child: Text('Large'),
              onTap: () => {},
            ),
            TextButton(
              child: Text('Large disabled'),
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
            FAB(
              child: Icon(EufemiaIcons.close),
              onTap: () {},
            ),
            FAB(
              child: Icon(EufemiaIcons.close),
            ),
          ],
        ),
      ),
    );
  }
}
