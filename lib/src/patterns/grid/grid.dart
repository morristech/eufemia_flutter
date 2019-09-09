import 'package:flutter/material.dart';

class EufemiaGrid extends StatelessWidget {
  final List<Widget> children;
  final int maxWidthCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;

  const EufemiaGrid({
    Key key,
    this.maxWidthCount = 2,
    this.children,
    this.mainAxisSpacing = 8.0,
    this.crossAxisSpacing = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: MediaQuery.of(context).size.width / maxWidthCount,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
      ),
      children: children,
    );
  }
}
