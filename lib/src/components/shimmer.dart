import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart' as shimmer;

/// A shimmer/skeleton placeholder component
class Shimmer extends StatelessWidget {
  /// Shimmer height
  final double height;

  /// Shimmer width
  final double width;

  /// The shape
  final BoxShape shape;

  /// Constructs a [PulsShimmer] object
  const Shimmer(
      {Key key, this.height = 16 * 1.33, this.width = 128, this.shape})
      : super(key: key);

  factory Shimmer.circular(double size) {
    return Shimmer(
      height: size,
      width: size,
      shape: BoxShape.circle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return shimmer.Shimmer.fromColors(
      baseColor: context.bright
          ? EufemiaColors.outlineGray
          : Colors.white.withOpacity(0.05),
      highlightColor: context.bright
          ? EufemiaColors.subtleGray
          : Colors.white.withOpacity(0.1),
      child: Container(
        decoration: BoxDecoration(
          shape: shape ?? BoxShape.rectangle,
          borderRadius: shape != null ? null : BorderRadius.circular(2.5),
          color: Colors.white,
        ),
        height: height,
        width: width,
      ),
    );
  }
}
