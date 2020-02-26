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
  final bool centerLabel;
  final String semanticLabel;
  final bool shadow;
  final bool border;
  final bool separator;
  final bool expand;

  /// A card from the Eufemia Design System
  ///
  /// * [child]: The main content of the card
  /// * [label]: Optional label to appear below the content
  /// * [semanticLabel]: Accessibility label
  const ContentCard({
    Key key,
    this.label,
    this.child,
    this.semanticLabel,
    this.shadow = true,
    this.border = true,
    this.separator = true,
    this.expand = false,
    this.centerLabel = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      child: SafeArea(
        top: !expand,
        bottom: !expand,
        left: !expand,
        right: !expand,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: shadow
                ? [
                    BoxShadow(
                      color: context.bright
                          ? _cardLightShadowColor
                          : _cardDarkShadowColor,
                      spreadRadius: _cardShadowSpreadRadius,
                      blurRadius: _cardShadowBlurRadius,
                      offset: _cardShadowOffset,
                    ),
                  ]
                : null,
            color: context.theme.cardColor,
            borderRadius: BorderRadius.circular(_cardBorderRadius),
            border: border
                ? Border.all(
                    width: _cardBorderWidth,
                    color: context.bright
                        ? _cardLightBorderColor
                        : _cardDarkBorderColor,
                  )
                : null,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(_cardBorderRadius),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SafeArea(
                  bottom: false,
                  child: child,
                ),
                if (label != null) ...{
                  if (separator) ...{
                    Container(
                      height: _cardBorderWidth,
                      color: context.bright
                          ? _cardLightBorderColor
                          : _cardDarkBorderColor,
                    ),
                  },
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: context.bright
                          ? _cardLightLabelColor
                          : _cardDarkLabelColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(_cardBorderRadius),
                        bottomRight: Radius.circular(_cardBorderRadius),
                      ),
                    ),
                    child: centerLabel ? Center(child: label) : label,
                  ),
                },
              ],
            ),
          ),
        ),
      ),
    );
  }
}
