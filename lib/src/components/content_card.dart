import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _cardShadowSpreadRadius = 4.0;
const double _cardShadowBlurRadius = 16.0;
const double _cardBorderRadius = 4.0;
const double _cardBorderWidth = 1.0;
final Color _cardLightLabelColor = EufemiaColors.subtleGray;
final Color _cardLightBorderColor = EufemiaColors.outlineGray;
final Color _cardLightShadowColor = EufemiaColors.lightShadow;
final Color _cardDarkLabelColor = Colors.black54;
final Color _cardDarkBorderColor = Colors.white.withOpacity(0.05);
final Color _cardDarkShadowColor = Colors.white.withOpacity(0.05);
final Offset _cardShadowOffset = Offset(0.0, 0.5);

/// A card from the Eufemia Design SystemR
class ContentCard extends StatelessWidget {
  final Widget child;
  final Widget label;
  final String semanticLabel;

  /// A card from the Eufemia Design System
  ///
  /// * [child]: The main content of the card
  /// * [label]: Optional label to appear below the content
  /// * [semanticLabel]: Accessibility label
  const ContentCard({Key key, this.label, this.child, this.semanticLabel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).brightness == Brightness.light
                  ? _cardLightShadowColor
                  : _cardDarkShadowColor,
              spreadRadius: _cardShadowSpreadRadius,
              blurRadius: _cardShadowBlurRadius,
              offset: _cardShadowOffset,
            ),
          ],
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(_cardBorderRadius),
          border: Border.all(
            width: _cardBorderWidth,
            color: Theme.of(context).brightness == Brightness.light
                ? _cardLightBorderColor
                : _cardDarkBorderColor,
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
                color: Theme.of(context).brightness == Brightness.light
                    ? _cardLightBorderColor
                    : _cardDarkBorderColor,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? _cardLightLabelColor
                      : _cardDarkLabelColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(_cardBorderRadius),
                    bottomRight: Radius.circular(_cardBorderRadius),
                  ),
                ),
                child: label,
              ),
            },
          ],
        ),
      ),
    );
  }
}