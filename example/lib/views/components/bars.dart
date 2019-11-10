import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class BarsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bars'),
        leading: IconButton(
          icon: Icon(EufemiaIcons.back_arrow),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ScrollableList(
        showBorders: false,
        children: [
          Toolbar(
            children: [
              Icon(EufemiaIcons.pencil),
            ],
          ),
          Toolbar(
            children: [
              Icon(EufemiaIcons.cog),
              Icon(EufemiaIcons.pencil),
            ],
          ),
          Toolbar(
            children: [
              Icon(EufemiaIcons.cog),
              Icon(EufemiaIcons.information),
              Icon(EufemiaIcons.pencil),
            ],
          ),
          Toolbar(
            children: [
              Icon(EufemiaIcons.cog),
              Icon(EufemiaIcons.information),
              Icon(EufemiaIcons.download),
              Icon(EufemiaIcons.pencil),
            ],
          ),
          Toolbar(
            children: [
              Icon(EufemiaIcons.cog),
              Icon(EufemiaIcons.information),
              Icon(EufemiaIcons.filter),
              Icon(EufemiaIcons.download),
              Icon(EufemiaIcons.pencil),
            ],
          ),
        ],
      ),
    );
  }
}
