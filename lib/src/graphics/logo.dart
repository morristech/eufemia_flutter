import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:eufemia/eufemia.dart';

const double _logoHeight = 24.0;

/// Contains asset paths to logo data
class LogoData {
  static const base = 'lib/assets/graphics/logos';
  static const dnb = '$base/dnb.svg';
  static const visa = '$base/visa.svg';
  static const mastercard = '$base/mastercard.svg';
  static const hbo = '$base/hbo.svg';
  static const netflix = '$base/netflix.svg';
  static const ruter = '$base/ruter.svg';
  static const spotify = '$base/spotify.svg';
  static const face_id = '$base/face_id.svg';
  static const touch_id = '$base/touch_id.svg';
  static const bank_id_mobile = '$base/bank_id_mobile.svg';
  static const bank_id = '$base/bank_id.svg';
  static const digipass = '$base/digipass.svg';
  static const pin = '$base/pin.svg';
  static const skyss = '$base/skyss.svg';
}

/// Logos from the Eufemia Design System
class Logo extends StatelessWidget {
  final String logo;
  final double width;
  final double height;
  final BoxFit fit;
  final Color color;

  const Logo(
    this.logo, {
    Key key,
    this.width,
    this.height = _logoHeight,
    this.fit = BoxFit.contain,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      logo,
      width: width,
      height: height,
      fit: fit,
      alignment: Alignment.center,
      package: 'eufemia',
      color: color ?? (context.bright ? null : Colors.white),
    );
  }
}
