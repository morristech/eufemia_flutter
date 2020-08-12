import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class ThemesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: Text('Themes'),
      ),
      body: SafeArea(
        child: ScrollableList(
          showBorders: false,
          children: [
            EufemiaPrimaryButton(
              child: Text('Regular'),
              onTap: () => EufemiaPalette.update(
                context,
                EufemiaPaletteData.regular(),
              ),
            ),
            EufemiaPrimaryButton(
              child: Text('Saga'),
              onTap: () => EufemiaPalette.update(
                context,
                EufemiaPaletteData.saga(),
              ),
            ),
            EufemiaPrimaryButton(
              child: Text('Private Banking'),
              onTap: () => EufemiaPalette.update(
                context,
                EufemiaPaletteData.privateBanking(),
              ),
            ),
            EufemiaPrimaryButton(
              child: Text('Dark'),
              onTap: () => EufemiaPalette.update(
                context,
                EufemiaPaletteData.dark(),
              ),
            ),
            Text(
              'Dark mode has to be enabled on a system level',
              style: EufemiaTypography.of(context)
                  .styles
                  .footnote
                  .copyWith(
                    color: EufemiaPalette.of(context).grey,
                  )
                  .toTextStyle(context),
            ),
          ]
              .map<Widget>(
                (widget) => Center(
                  child: EufemiaPadding.small(child: widget),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
