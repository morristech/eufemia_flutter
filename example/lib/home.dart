import 'package:eufemia_example/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:eufemia/eufemia.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Eufemia.darkTheme,
      child: Scaffold(
        appBar: EufemiaAppBars.standard(
          
          icon: Icon(
            EufemiaIcons.eufemia,
            size: 32,
          ),
          title: 'Eufemia',
          automaticallyImplyLeading: false,
        ),
        body: EufemiaGrid(
          children: [
            EufemiaGridTile(
              color: EufemiaColors.mintGreen,
              title: Text(
                'Components',
              ),
              onTap: () => Navigator.pushNamed(context, Routes.components),
            ),
            EufemiaGridTile(
              color: EufemiaColors.mintGreen,
              title: Text(
                'Patterns',
              ),
              onTap: () => Navigator.pushNamed(context, Routes.components),
            ),
            EufemiaGridTile(
              color: EufemiaColors.mintGreen,
              title: Text(
                'Typography',
              ),
              onTap: () => Navigator.pushNamed(context, Routes.components),
            ),
          ],
        ),
      ),
    );
  }
}
