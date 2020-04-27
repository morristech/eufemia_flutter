import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class GradientWidget extends StatelessWidget {
  GradientWidget({@required this.child, this.gradient});

  final Widget child;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient?.createShader(Offset.zero & bounds.size) ??
            LinearGradient(
              colors: [
                EufemiaColors.mintGreen.withOpacity(0.2),
                EufemiaColors.mintGreen.withOpacity(0.1),
                Colors.transparent
              ],
              stops: [0.0, 0.4, 1.0],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ).createShader(Offset.zero & bounds.size);
      },
      child: child,
    );
  }
}
