import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Icons'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIcon(
            'assets/icons/eufemia.svg',
          ),
          CustomIcon(
            'assets/icons/eufemia.svg',
            backgroundColor: EufemiaColors.seaGreenAlt,
          ),
        ],
      ),
    );
  }
}
