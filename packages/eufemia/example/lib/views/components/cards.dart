import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class CardsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final typography = EufemiaTypography.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
        leading: IconButton(
          icon: Icon(EufemiaIcons.back_arrow),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: EufemiaColumn(
          spaceBetween: EufemiaSpace.small,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ContentCard(
                child: Container(
                  width: 80.0,
                  height: 80.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ContentCard(
                child: Container(
                  width: 80.0,
                  height: 80.0,
                ),
                label: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Label',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ContentCard.accent(
                context: context,
                child: Container(
                  width: 80.0,
                  height: 80.0,
                ),
                label: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: EufemiaColumn(
                      spaceBetween: EufemiaSpace.extraSmall,
                      children: [
                        Text(
                          'Drag & drop',
                          style: typography.styles.bodyEmphasized
                              .toTextStyle(context),
                        ),
                        Text(
                          'This is an example of a content card with an accent color',
                          style: typography.styles.subhead.toTextStyle(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
