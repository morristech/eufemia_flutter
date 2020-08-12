import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class ShimmerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: Text('Shimmer'),
      ),
      body: ScrollableList(
        showBorders: false,
        padding: EufemiaInsets.medium(EufemiaSides.top),
        spaceBetween: EufemiaSpace.small,
        children: [
          Shimmer(
            child: Logo(
              LogoData.dnb,
              height: 50,
            ),
          ),
          EufemiaRow(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spaceBetween: EufemiaSpace.small,
            children: [
              Shimmer(width: 24, height: 24),
              Shimmer(height: 24, width: 200),
            ],
          ),
        ],
      ),
    );
  }
}
