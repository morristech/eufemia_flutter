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
        child: ScrollableList(
          showBorders: false,
          spaceBetween: EufemiaSpace.small,
          children: [
            EufemiaPadding.medium(
              child: ContentCard(
                child: Container(
                  width: 80.0,
                  height: 80.0,
                ),
              ),
            ),
            EufemiaPadding.medium(
              child: ContentCard(
                child: Container(
                  width: 80.0,
                  height: 80.0,
                ),
                label: EufemiaPadding.small(
                  child: Center(
                    child: Text(
                      'Label',
                    ),
                  ),
                ),
              ),
            ),
            EufemiaPadding.medium(
              child: ContentCard.accent(
                context: context,
                child: Container(
                  width: 80.0,
                  height: 80.0,
                ),
                label: EufemiaPadding.small(
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
