import 'package:eufemia/eufemia.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart' as shimmer;

/// A shimmer/skeleton placeholder component
class Shimmer extends StatelessWidget {
  /// Shimmer height
  final double height;

  /// Shimmer width
  final double width;

  /// The shape of the Shimmer
  final BoxShape shape;

  const Shimmer({
    Key key,
    this.height = 16 * 1.33,
    this.width = 128,
    this.shape = BoxShape.rectangle,
  }) : super(key: key);

  factory Shimmer.circular(double size) {
    return Shimmer(
      height: size,
      width: size,
      shape: BoxShape.circle,
    );
  }

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);

    return shimmer.Shimmer.fromColors(
      baseColor: palette.shimmerBase,
      highlightColor: palette.shimmerHighlight,
      child: Container(
        decoration: BoxDecoration(
          shape: shape,
          borderRadius: shape != null ? null : BorderRadius.circular(2.0),
          color: palette.white,
        ),
        height: height,
        width: width,
      ),
    );
  }
}
