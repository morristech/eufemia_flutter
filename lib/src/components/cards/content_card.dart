import 'package:eufemia/components.dart';
import 'package:eufemia/palette.dart';
import 'package:eufemia/spacing.dart';
import 'package:eufemia/typography.dart';
import 'package:flutter/material.dart';

/// {@category Components}
/// {@subCategory Cards}
/// A card from the Eufemia Design System.
class ContentCard extends StatelessWidget {
  /// {@macro flutter.widgets.child}
  final Widget child;

  /// The label to be shown in a separate box under the [child]
  final Widget label;

  /// {@template eufemia.semantics.semanticLabel}
  /// A descriptive label to attach to the semantics tree for
  /// accessibility purposes.
  /// {@endtemplate}
  final String semanticLabel;

  /// If the [ContentCard] should render a backdrop shadow
  final bool shadow;

  /// If the [ContentCard] should have borders around it
  final bool border;

  /// If the [ContentCard] should have a separator between the [child] and the
  /// [label]. Only used if both values are provided.
  final bool separator;

  /// The background color for the child widget.
  final Color color;

  /// The background color for the [label] widget.
  final Color labelColor;

  /// The background widget to render behind the [child] widget.
  final Widget background;

  /// A custom shadow to replace the default shadow. Is not displayed if [shadow]
  /// is false.
  final List<BoxShadow> boxShadow;

  /// The width of the [ContentCard], expands if unset
  final double width;

  /// The height of the [ContentCard], expands if unset
  final double height;

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

  /// Creates a [ContentCard] with an accent background color derived from
  /// either [context] or [palette]
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
