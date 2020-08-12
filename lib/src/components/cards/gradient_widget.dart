import 'package:eufemia/palette.dart';
import 'package:flutter/material.dart';

class GradientWidget extends StatelessWidget {
  GradientWidget({
    @required this.child,
    this.gradient,
  });

  final Widget child;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return ((gradient ?? defaultGradient) as Gradient)
            .createShader(Offset.zero & bounds.size);
      },
      child: child,
    );
  }

  Gradient defaultGradient(BuildContext context) {
    final palette = EufemiaPalette.of(context);

    return LinearGradient(
      colors: [
        palette.accent.withOpacity(0.2),
        palette.accent.withOpacity(0.1),
        Colors.transparent
      ],
      stops: [0.0, 0.4, 1.0],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );
  }
}
