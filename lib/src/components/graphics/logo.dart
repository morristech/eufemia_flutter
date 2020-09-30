import 'package:eufemia/palette.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

/// {@category Components}
/// {@subCategory Graphics}
/// Static class wrapping asset paths for logo data
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

/// {@category Components}
/// {@subCategory Graphics}
/// A logo from the Eufemia design system.
class Logo extends StatelessWidget {
  /// The logo asset to use (use [LogoData] for static assets).
  final String logo;

  /// The width of the logo.
  final double width;

  /// The height of the logo.
  final double height;

  /// The [BoxFit] of the logo.
  final BoxFit fit;

  /// The [Color] to override the logo with.
  final Color color;

  /// If true, the logo is colored according to the [EufemiaPalette]'s icon
  /// color
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

  /// Creates a logo with a color matching the current [EufemiaPalette]'s icon
  /// color
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
      package: 'eufemia',
      color: themed ? palette.icon : color,
    );
  }
}
