import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class CardsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
        leading: IconButton(
          icon: Icon(EufemiaIcons.back_arrow),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
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
                      style: context.textTheme.subtitle2,
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
