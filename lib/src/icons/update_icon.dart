import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UpdateIcon extends StatelessWidget {
  final double width;
  final double height;
  final BoxFit fit;
  final TargetPlatform platform;

  const UpdateIcon({
    Key key,
    this.width = 40,
    this.height = 40,
    this.fit = BoxFit.contain,
    this.platform = TargetPlatform.iOS,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS && platform == TargetPlatform.iOS) {
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
