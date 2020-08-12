import 'package:eufemia/palette.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

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
  final bool themed;

  const Logo(
    this.logo, {
    Key key,
    this.width,
    this.height = 24.0,
    this.fit = BoxFit.contain,
    this.color,
    this.themed = false,
  }) : super(key: key);

  factory Logo.themed(String logo) {
    return Logo(logo, themed: true);
  }

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);

    return SvgPicture.asset(
      logo,
      width: width,
      height: height,
      fit: fit,
      alignment: Alignment.center,
      package: 'eufemia_components',
      color: themed ? palette.icon : color,
    );
  }
}
