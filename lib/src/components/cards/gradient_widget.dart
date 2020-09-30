import 'package:eufemia/palette.dart';
import 'package:flutter/material.dart';

/// {@category Components}
/// {@subCategory Cards}
/// A widget masking its child with a gradient. Can be used for overlay effects
/// like fades, color gradients etc.
class GradientWidget extends StatelessWidget {
  /// {@macro flutter.widgets.child}
  final Widget child;

  /// A gradient to use as the mask
  final Gradient gradient;

  GradientWidget({
    @required this.child,
    this.gradient,
  });

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
