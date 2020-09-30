import 'package:flutter/material.dart';

/// {@category Components}
/// {@subCategory Graphics}
/// The golden ratio. In mathematics, two quantities are in the golden ratio if
/// their ratio is the same as the ratio of their sum to the larger of the two
/// quantities.
const goldenRatio = 1.618;

/// {@category Components}
/// {@subCategory List}
/// A plain base/background for a [PaymentCard]
class CardBase extends StatelessWidget {
  /// If the base should be lit up by a soft light.
  final bool softLight;

  /// The gradient's starting color.
  final Color startColor;

  /// The gradient's ending color.
  final Color endColor;

  /// The gradient for the card. Overrides the [startColor], [endColor] and
  /// [stops] values.
  final LinearGradient gradient;

  /// The gradient's stops
  final List<double> stops;

  const CardBase({
    Key key,
    this.softLight = true,
    this.startColor,
    this.endColor,
    this.stops,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        fit: StackFit.expand,
        overflow: Overflow.clip,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: gradient ??
                  LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      startColor,
                      endColor,
                    ],
                    stops: stops ?? [0.0631, 0.8266],
                  ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          if (softLight) ...{
            Positioned(
              top: -75,
              right: -75,
              child: Opacity(
                opacity: 0.16,
                child: Container(
                  height: constraints.maxWidth * 0.7,
                  width: constraints.maxWidth * 0.7,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        Colors.white,
                        Colors.white.withOpacity(0.0001),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          }
        ],
      );
    });
  }
}
