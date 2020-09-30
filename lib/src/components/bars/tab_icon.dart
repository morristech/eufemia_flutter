import 'package:eufemia/palette.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_drawing/path_drawing.dart';

/// {@category Components}
/// {@subCategory Bars}
/// A tab icon from the Eufemia design system.
class TabIcon extends StatefulWidget {
  /// If the tah is selected or not
  final bool selected;

  /// The asset path to use, must point to an SVG file
  final String asset;

  const TabIcon({Key key, this.selected, this.asset}) : super(key: key);

  @override
  _TabIconState createState() => _TabIconState();
}

class _TabIconState extends State<TabIcon> {
  String svgData;

  @override
  void initState() {
    super.initState();
    loadPaths();
  }

  Future<void> loadPaths() async {
    final svg = await rootBundle.loadString(widget.asset);

    setState(() {
      svgData = svg;
    });
  }

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);

    final path = parseSvgPathData(svgData);

    return Stack(
      children: [
        AnimatedOpacity(
          duration: Duration(milliseconds: 80),
          opacity: widget.selected ? 1.0 : 0.0,
          child: ClipPath(
            clipper: PathClipper(path),
            child: Container(
              color: palette.accent,
            ),
          ),
        ),
        SvgPicture.asset(widget.asset, color: palette.icon),
      ],
    );
  }
}

class PathClipper extends CustomClipper<Path> {
  final Path path;

  PathClipper(this.path);

  @override
  Path getClip(Size size) => path;

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
