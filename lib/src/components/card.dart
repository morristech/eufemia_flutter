import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _cardShadowSpreadRadius = 4.0;
const double _cardShadowBlurRadius = 16.0;
const double _cardBorderRadius = 4.0;
const double _cardBorderWidth = 1.0;
final Color _cardColor = Colors.white;
final Color _cardLabelColor = EufemiaColors.subtleGray;
final Color _cardBorderColor = EufemiaColors.outlineGray;
final Color _cardShadowColor = EufemiaColors.lightShadow;
final Offset _cardShadowOffset = Offset(0.0, 0.5);

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
              color: _cardShadowColor,
              spreadRadius: _cardShadowSpreadRadius,
              blurRadius: _cardShadowBlurRadius,
              offset: _cardShadowOffset,
            ),
          ],
          color: _cardColor,
          borderRadius: BorderRadius.circular(_cardBorderRadius),
          border: Border.all(
            width: _cardBorderWidth,
            color: _cardBorderColor,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            child,
            if (label != null) ...{
              Container(
                height: _cardBorderWidth,
                color: _cardBorderColor,
              ),
              Container(
                color: _cardLabelColor,
                child: label,
              ),
            },
          ],
        ),
      ),
    );
  }
}
