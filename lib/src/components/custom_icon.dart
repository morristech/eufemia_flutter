import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const _iconSize = 32.0;

class CustomIcon extends StatelessWidget {
  final String asset;
  final Color backgroundColor;
  final Color color;
  final double size;

  const CustomIcon(this.asset, {Key key, this.color, this.backgroundColor, this.size = _iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
          hasBackground ? (Theme.of(context).platform == TargetPlatform.iOS ? 4.0 : 6.0) : 0.0),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: hasBackground ? backgroundColor : null,
        borderRadius: Theme.of(context).platform == TargetPlatform.iOS
            ? BorderRadius.circular(8.0)
            : BorderRadius.circular(100),
      ),
      child: SvgPicture.asset(
        asset,
        color: color ?? hasBackground ? null : EufemiaColors.seaGreenAlt,
      ),
    );
  }

  bool get hasBackground => backgroundColor != null;
}
