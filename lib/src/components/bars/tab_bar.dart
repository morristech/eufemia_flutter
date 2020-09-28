import 'package:eufemia/components.dart';
import 'package:eufemia/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const double _kTabHeight = 81.0;

class EufemiaTabBar extends StatefulWidget implements PreferredSizeWidget {
  /// The list of [EufemiaTab] to display.
  final List<EufemiaTab> tabs;

  /// Optional [TabController], uses the context's [DefaultTabController] if not set.
  final TabController controller;

  /// The padding around the [EufemiaTabBar].
  final EufemiaInsets padding;

  /// If the tab bar is scrollable or not. Defaults to [true].
  final bool isScrollable;

  /// The semantic label to expose to accessibility utilities
  final String semanticsLabel;

  EufemiaTabBar({
    Key key,
    this.tabs,
    this.controller,
    this.isScrollable = true,
    this.semanticsLabel = 'Tab bar',
  })  : preferredSize = Size.fromHeight(_kTabHeight),
        padding = EufemiaInsets.medium(EufemiaSides.horizontal),
        super(key: key);

  @override
  _EufemiaTabBarState createState() => _EufemiaTabBarState();

  @override
  final Size preferredSize;
}

class _EufemiaTabBarState extends State<EufemiaTabBar> {
  TabController controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller = (widget.controller ?? DefaultTabController.of(context))
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    final adjustedTabs = widget.tabs
        .map((tab) => EufemiaTab(
              key: tab.key,
              label: tab.label,
              index: widget.tabs.indexOf(tab),
              onSelected: () {
                tab.onSelected?.call();
                controller.animateTo(widget.tabs.indexOf(tab));
                setState(() {});
              },
            ))
        .toList();

    Widget bar = EufemiaRow(
      padding: widget.padding,
      mainAxisAlignment: MainAxisAlignment.start,
      spaceBetween: EufemiaSpace.small,
      children: adjustedTabs,
    );

    if (widget.isScrollable) {
      bar = SingleChildScrollView(
        child: bar,
        scrollDirection: Axis.horizontal,
      );
    }

    return Semantics(
      label: widget.semanticsLabel,
      child: bar,
    );
  }
}
