import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _kCardShadowSpreadRadius = 4.0;
const double _kCardShadowBlurRadius = 16.0;
const double _kCardBorderRadius = 4.0;
const double _kCardBorderWidth = 1.0;
final Color _kCardColor = Colors.white;
final Color _kCardBorderColor = EufemiaColors.outlineGray;
final Color _kCardShadowColor = EufemiaColors.lightShadow;
final Offset _kCardShadowOffset = Offset(0.0, 0.5);

/// A card from the Eufemia Design System
class Card extends StatelessWidget {
  final Widget child;
  final Widget label;
  final String semanticLabel;

  /// A card from the Eufemia Design System
  ///
  /// * [child]: The main content of the card
  /// * [label]: Optional label to appear below the content
  /// * [semanticLabel]: Accessibility label
  const Card({Key key, this.label, this.child, this.semanticLabel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: _kCardShadowColor,
              spreadRadius: _kCardShadowSpreadRadius,
              blurRadius: _kCardShadowBlurRadius,
              offset: _kCardShadowOffset,
            ),
          ],
          color: _kCardColor,
          borderRadius: BorderRadius.circular(_kCardBorderRadius),
          border: Border.all(
            width: _kCardBorderWidth,
            color: _kCardBorderColor,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            child,
            if (label != null) ...{
              Container(
                height: _kCardBorderWidth,
                color: _kCardBorderColor,
              ),
              label,
            },
          ],
        ),
      ),
    );
  }
}
