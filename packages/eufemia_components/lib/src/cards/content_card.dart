import 'package:eufemia_components/eufemia_components.dart';
import 'package:eufemia_palette/eufemia_palette.dart';
import 'package:eufemia_spacing/eufemia_spacing.dart';
import 'package:eufemia_typography/eufemia_typography.dart';
import 'package:flutter/material.dart';

/// A card from the Eufemia Design SystemR
class ContentCard extends StatelessWidget {
  final Widget child;
  final Widget label;
  final String semanticLabel;
  final bool shadow;
  final bool border;
  final bool separator;
  final Color color;
  final Color labelColor;
  final Widget background;
  final List<BoxShadow> boxShadow;
  final double width;
  final double height;

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
    this.shadow,
    this.border = true,
    this.separator = true,
    this.color,
    this.background,
    this.boxShadow,
    this.labelColor,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);
    final typography = EufemiaTypography.of(context);
    var dropShadow = shadow;
    dropShadow ??= palette.bright ? true : false;

    return Semantics(
      label: semanticLabel,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          boxShadow: dropShadow ? boxShadow ?? adaptiveShadows(context) : null,
          color: color ?? palette.card,
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            width: border ? 1.0 : 0.0,
            color: palette.outline,
          ),
        ),
        child: EufemiaColumn(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              fit: StackFit.loose,
              overflow: Overflow.clip,
              children: <Widget>[
                if (background != null) ...{
                  Positioned.fill(
                    child: background,
                  ),
                },
                SafeArea(
                  bottom: false,
                  child: child,
                ),
              ],
            ),
            if (label != null) ...{
              if (separator) ...{
                Container(height: 1.0, color: palette.outline),
              },
              Container(
                decoration: BoxDecoration(
                  color: palette.card,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(4.0),
                    bottomRight: Radius.circular(4.0),
                  ),
                ),
                child: AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 160),
                  child: Center(child: label),
                  style: typography.styles.footnote.toTextStyle(context),
                ),
              ),
            },
          ],
        ),
      ),
    );
  }

  factory ContentCard.accent({
    BuildContext context,
    EufemiaPaletteData palette,
    Widget child,
    Widget label,
    String semanticLabel,
    bool shadow,
    bool border = true,
    bool separator = true,
    Widget background,
    List<BoxShadow> boxShadow,
  }) {
    assert(palette != null || context != null);
    palette ??= EufemiaPalette.of(context);

    return ContentCard(
      semanticLabel: semanticLabel,
      color: palette.accent,
      labelColor: palette.card,
      background: background,
      separator: separator,
      boxShadow: boxShadow,
      shadow: shadow,
      border: border,
      child: child,
      label: label,
    );
  }
}
