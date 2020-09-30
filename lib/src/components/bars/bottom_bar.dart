import 'package:eufemia/palette.dart';
import 'package:eufemia/spacing.dart';
import 'package:eufemia/typography.dart';
import 'package:flutter/material.dart';

import 'bar.dart';

/// {@category Components}
/// {@subCategory Bars}
/// A bottom app bar from the Eufemia design system.
class BottomBar extends StatefulWidget {
  /// {@macro flutter.widgets.TabController}
  final TabController controller;

  /// The children in their `active` state.
  ///
  /// {@macro flutter.widgets.children}
  final List<Widget> active;

  /// The children in their `inactive` state.
  ///
  /// {@macro flutter.widgets.children}
  final List<Widget> inactive;

  /// The labels for the tabs, indexed in the same order.
  ///
  /// {@macro flutter.widgets.children}
  final List<Widget> labels;

  /// {@macro eufemia.gestures.onLongPress}
  final Function(int) onLongPress;

  /// {@macro eufemia.gestures.onSelected}
  final Function(int) onSelected;

  /// The builder that defines the transition between a tab's `active`
  /// and `inactive` state.
  final TransitionBuilder transitionBuilder;

  const BottomBar({
    Key key,
    this.controller,
    this.onLongPress,
    this.onSelected,
    this.active,
    this.inactive,
    this.labels,
    this.transitionBuilder,
  })  : assert(active.length == inactive.length),
        assert(labels == null || labels?.length == active.length),
        super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selected;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Bar(
      children: list,
      onSelected: widget.onSelected,
      onLongPress: widget.onLongPress,
    );
  }

  List<Widget> get list {
    final typography = EufemiaTypography.of(context);
    final palette = EufemiaPalette.of(context);

    var temp = widget.inactive;

    for (final element in temp) {
      final index = temp.indexOf(element);
      var style = typography.styles.subhead.toTextStyle(context).copyWith(
            fontSize: 10.0,
            height: 1.2,
          );

      if (widget.controller.index == index) {
        temp[index] = widget.active[index];
        style = style.copyWith(color: palette.icon);
      }
      if (widget.labels != null) {
        temp[index] = EufemiaColumn(
          spaceBetween: EufemiaSpace.extraSmall,
          mainAxisSize: MainAxisSize.min,
          children: [
            temp[index],
            Center(
              child: AnimatedDefaultTextStyle(
                duration: Duration(milliseconds: 160),
                style: style,
                child: widget.labels[index],
              ),
            ),
          ],
        );
      }
    }

    return temp.map((e) {
      return GestureDetector(
        onTap: () => widget.onSelected?.call(temp.indexOf(e)),
        onLongPress: () => widget.onLongPress?.call(temp.indexOf(e)),
        child: AnimatedSwitcher(
          key: ValueKey(temp.indexOf(e)),
          duration: Duration(milliseconds: 320),
          transitionBuilder: widget.transitionBuilder ?? defaultTransition,
          child: e,
        ),
      );
    }).toList();
  }

  Widget defaultTransition(Widget child, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
