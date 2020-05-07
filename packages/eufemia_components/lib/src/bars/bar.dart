import 'package:eufemia_palette/eufemia_palette.dart';
import 'package:eufemia_spacing/eufemia_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  /// The height of the bar
  final double height;

  /// Which axis the bar should be laid out on
  final Axis direction;

  /// Key/value pair where the key is the label and the value is the tab
  final List<Widget> children;

  /// The [TabController] that controls the tabs
  final TabController controller;

  /// Callback when a tab is pressed
  final Function(int) onSelected;

  /// Callback when a tab is long-pressed
  final Function(int) onLongPress;

  /// Content padding
  final EufemiaInsets padding;

  final MainAxisAlignment mainAxisAlignment;

  const Bar({
    Key key,
    this.children,
    this.controller,
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
