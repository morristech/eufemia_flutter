import 'package:flutter/material.dart';

/// Splash factory that disables all ripple effects
class NoSplashFactory extends InteractiveInkFeatureFactory {
  const NoSplashFactory();

  @override
  InteractiveInkFeature create({
    MaterialInkController controller,
    RenderBox referenceBox,
    Offset position,
    Color color,
    TextDirection textDirection,
    bool containedInkWell = false,
    Rect Function() rectCallback,
    BorderRadius borderRadius,
    ShapeBorder customBorder,
    double radius,
    Function() onRemoved,
  }) {
    return NoSplash(
      controller: controller,
      referenceBox: referenceBox,
    );
  }
}

class NoSplash extends InteractiveInkFeature {
  NoSplash({
    @required MaterialInkController controller,
    @required RenderBox referenceBox,
  })  : assert(controller != null),
        assert(referenceBox != null),
        super(
          controller: controller,
          referenceBox: referenceBox,
        );

  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {}
}
