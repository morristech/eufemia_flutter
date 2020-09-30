import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:eufemia/components.dart';

/// {@category Components}
/// {@subCategory Icons}
/// An adaptive illustration to signal an available update.
class UpdateIcon extends StatelessWidget {
  /// The width of the illustration.
  final double width;

  /// The height of the illustration.
  final double height;

  /// The [BoxFit] of the illustration.
  final BoxFit fit;

  /// Optional platform override.
  final TargetPlatform platform;

  const UpdateIcon({
    Key key,
    this.width = 40,
    this.height = 40,
    this.fit = BoxFit.contain,
    this.platform,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _platform = platform ?? context.platform;
    if (_platform == TargetPlatform.iOS || _platform == TargetPlatform.macOS) {
      return SvgPicture.asset(
        'lib/assets/graphics/other/app_store_update.svg',
        package: 'eufemia',
        width: width,
        height: height,
        fit: fit,
      );
    } else {
      return SvgPicture.asset(
        'lib/assets/graphics/other/play_store_update.svg',
        package: 'eufemia',
        width: width,
        height: height,
        fit: fit,
      );
    }
  }
}
