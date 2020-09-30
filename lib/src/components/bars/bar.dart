import 'package:eufemia/palette.dart';
import 'package:eufemia/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// {@category Components}
/// {@subCategory Bars}
/// A higher-order [Bar] widget that can be used to display any kind of bar.
class Bar extends StatelessWidget implements PreferredSizeWidget {
  /// {@template eufemia.spacing.height}
  /// The height of the widget.
  /// {@endtemplate}
  final double height;

  /// {@macro flutter.rendering.Axis}
  final Axis direction;

  /// {@macro flutter.widgets.children}
  final List<Widget> children;

  /// {@template eufemia.gestures.onSelected}
  /// Thecallback function to be called when something has been selected, with
  /// any value being passed as a parameter.
  /// {@endtemplate}
  final Function(int) onSelected;

  /// {@template eufemia.gestures.onLongPress}
  /// A callback function to be called when a widget has been pressed
  /// for an extended period of time, optionally with a value argument
  /// {@endtemplate}
  final Function(int) onLongPress;

  /// {@macro eufemia.spacing.insets}
  final EufemiaInsets padding;

  /// {@template flutter.rendering.MainAxisAlignment}
  /// How the children should be placed along the main axis in a flex layout.
  ///
  /// See also:
  ///
  /// [Column], [Row], and [Flex], the flex widgets.
  /// [RenderFlex], the flex render object.
  /// {@endtemplate}
  final MainAxisAlignment mainAxisAlignment;

  const Bar({
    Key key,
    this.children,
    this.height = 24.0,
    this.direction = Axis.horizontal,
    this.onSelected,
    this.onLongPress,
    this.padding = EufemiaInsets.allSmall,
    this.mainAxisAlignment = MainAxisAlignment.spaceEvenly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: .5,
            color: palette.shadow,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: EufemiaFlex(
          padding: padding,
          direction: direction,
          children: children,
          mainAxisAlignment: mainAxisAlignment,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
