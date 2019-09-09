import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EufemiaAppBars.standard(
        title: 'Buttons',
        onBackPressed: () => Navigator.pop(context),
      ),
      body: EufemiaListView(
        alignment: Alignment.centerLeft,
        backgroundColor: Colors.white,
        padding: const EdgeInsets.all(8.0),
        children: [
          buildButtonShowcase(
            EufemiaButton(
              text: 'Primary button with text only',
              onPressed: () {},
            ),
          ),
          buildButtonShowcase(
            EufemiaButton(
              variant: Variant.secondary,
              text: 'Secondary button with text only',
              onPressed: () {},
            ),
          ),
          buildButtonShowcase(
            EufemiaButton(
              text: 'Disabled primary button',
            ),
          ),
          buildButtonShowcase(
            EufemiaButton(
              variant: Variant.secondary,
              text: 'Disabled secondary button',
            ),
          ),
          buildButtonShowcase(
            EufemiaButton(
              text: 'Primary button with icon',
              icon: EufemiaIcons.chevron_right,
              onPressed: () {},
            ),
          ),
          buildButtonShowcase(
            EufemiaButton(
              text: 'Primary button with icon on left',
              icon: EufemiaIcons.chevron_left,
              iconPosition: Position.left,
              onPressed: () {},
            ),
          ),
          buildButtonShowcase(
            EufemiaButton(
              variant: Variant.tertiary,
              text: 'Tertiary button',
              icon: EufemiaIcons.chevron_right,
              onPressed: () {},
            ),
          ),
          buildButtonShowcase(
            EufemiaButton(
              variant: Variant.tertiary,
              text: 'Tertiary button',
              icon: EufemiaIcons.chevron_right,
              iconSize: IconSize.medium,
              onPressed: () {},
            ),
          ),
          buildButtonShowcase(
            EufemiaButton(
              variant: Variant.tertiary,
              text: 'Disabled tertiary button',
              icon: EufemiaIcons.chevron_left,
              iconPosition: Position.left,
              iconSize: IconSize.small,
            ),
          ),
          buildButtonShowcase(
            EufemiaButton(
              variant: Variant.signal,
              text: 'Signal button',
              icon: EufemiaIcons.bell,
              onPressed: () {},
            ),
          ),
          buildButtonShowcase(
            EufemiaButton(
              variant: Variant.signal,
              text: 'Large Signal button',
              icon: EufemiaIcons.bell,
              iconSize: IconSize.medium,
              buttonSize: ButtonSize.large,
              onPressed: () {},
            ),
          ),
          Row(
            children: [
              buildButtonShowcase(
                EufemiaButton(
                  icon: EufemiaIcons.pencil,
                  buttonSize: ButtonSize.small,
                  onPressed: () {},
                ),
              ),
              buildButtonShowcase(
                EufemiaButton(
                  icon: EufemiaIcons.add,
                  buttonSize: ButtonSize.medium,
                  onPressed: () {},
                ),
              ),
              buildButtonShowcase(
                EufemiaButton(
                  icon: EufemiaIcons.exclamation,
                  buttonSize: ButtonSize.large,
                  onPressed: () {},
                ),
              ),
              buildButtonShowcase(
                EufemiaButton(
                  icon: EufemiaIcons.search,
                  buttonSize: ButtonSize.small,
                ),
              ),
              buildButtonShowcase(
                EufemiaButton(
                  icon: EufemiaIcons.trash,
                  buttonSize: ButtonSize.medium,
                ),
              ),
              buildButtonShowcase(
                EufemiaButton(
                  icon: EufemiaIcons.question,
                  buttonSize: ButtonSize.large,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildButtonShowcase(Widget button) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: button,
    );
  }
}
