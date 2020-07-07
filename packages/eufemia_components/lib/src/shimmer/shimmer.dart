import 'package:eufemia_palette/eufemia_palette.dart';
import 'package:eufemia_typography/eufemia_typography.dart';
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

  final Widget child;

  const Shimmer({
    Key key,
    this.height = 16 * 1.33,
    this.width = 128,
    this.shape = BoxShape.rectangle,
    this.child,
  }) : super(key: key);

  factory Shimmer.circular(double size) {
    return Shimmer(
      height: size,
      width: size,
      shape: BoxShape.circle,
    );
  }

  factory Shimmer.fromTextStyle(
    BuildContext context,
    EufemiaTextStyle style, {
    double width,
  }) {
    return Shimmer(
      height: style.height.toPoints(context: context) *
          style.size.toPoints(context: context),
      width: width,
    );
  }

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);

    return shimmer.Shimmer.fromColors(
      period: Duration(milliseconds: 2500),
      baseColor: palette.shimmerBase,
      highlightColor: palette.shimmerHighlight,
      child: child ??
          Container(
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
