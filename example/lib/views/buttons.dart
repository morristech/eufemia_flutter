import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class ButtonsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: Navbar(
          title: Text('Buttons'),
          bottom: EufemiaTabBar(
            tabs: [
              EufemiaTab(label: 'Primary'),
              EufemiaTab(label: 'Secondary'),
              EufemiaTab(label: 'Vivid'),
              EufemiaTab(label: 'Text'),
              EufemiaTab(label: 'FAB'),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              PrimaryButtonList(),
              SecondaryButtonList(),
              VividButtonList(),
              TextButtonList(),
              FloatingActionButtonList(),
            ],
          ),
        ),
      ),
    );
  }
}

class FloatingActionButtonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollableList(
      spaceBetween: EufemiaSpace.medium,
      padding: EufemiaInsets.allMedium,
      showBorders: false,
      children: [
        EufemiaFloatingActionButton(
          child: Icon(EufemiaIcons.close),
          onTap: () {},
        ),
        EufemiaFloatingActionButton(
          child: Icon(EufemiaIcons.close),
        ),
      ],
    );
  }
}

class TextButtonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollableList(
      spaceBetween: EufemiaSpace.medium,
      padding: EufemiaInsets.allMedium,
      showBorders: false,
      children: [
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
      ],
    );
  }
}

class VividButtonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollableList(
      spaceBetween: EufemiaSpace.medium,
      padding: EufemiaInsets.allMedium,
      showBorders: false,
      children: [
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
      ],
    );
  }
}

class SecondaryButtonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollableList(
      spaceBetween: EufemiaSpace.medium,
      padding: EufemiaInsets.allMedium,
      showBorders: false,
      children: [
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
      ],
    );
  }
}

class PrimaryButtonList extends StatelessWidget {
  const PrimaryButtonList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollableList(
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
      ],
    );
  }
}
