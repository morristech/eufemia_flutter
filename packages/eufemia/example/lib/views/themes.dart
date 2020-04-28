import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class ThemesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Themes'),
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
              child: Text('Regular'),
              onTap: () => EufemiaPalette.update(
                context,
                EufemiaPaletteData.regular(),
              ),
            ),
            PrimaryButton(
              child: Text('Saga'),
              onTap: () => EufemiaPalette.update(
                context,
                EufemiaPaletteData.saga(),
              ),
            ),
            PrimaryButton(
              child: Text('Private Banking'),
              onTap: () => EufemiaPalette.update(
                context,
                EufemiaPaletteData.privateBanking(),
              ),
            ),
            PrimaryButton(
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
                  .copyWith
                  .call(
                    color: EufemiaPalette.of(context).grey,
                  )
                  .toTextStyle(context),
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
