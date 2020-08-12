import 'package:eufemia/components.dart';
import 'package:eufemia/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const double _kTabHeight = 81.0;

class EufemiaTabBar extends StatefulWidget implements PreferredSizeWidget {
  final List<EufemiaTab> tabs;
  final TabController controller;

  EufemiaTabBar({Key key, this.tabs, this.controller})
      : preferredSize = Size.fromHeight(_kTabHeight),
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
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final adjustedTabs = widget.tabs
        .map((tab) => EufemiaTab(
              key: tab.key,
              label: tab.label,
              active: controller.index == widget.tabs.indexOf(tab),
              onSelected: () {
                tab.onSelected?.call();
                controller.animateTo(widget.tabs.indexOf(tab));
                setState(() {});
              },
            ))
        .toList();

    return EufemiaRow(
      padding: EufemiaInsets.medium(EufemiaSides.left),
      mainAxisAlignment: MainAxisAlignment.start,
      spaceBetween: EufemiaSpace.small,
      children: adjustedTabs,
    );
  }
}
