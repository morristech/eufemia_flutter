import 'package:eufemia/components.dart';
import 'package:eufemia/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const double _kTabHeight = 81.0;

/// {@category Components}
/// {@subCategory Bars}
/// A tab bar from the Eufemia design system.
class EufemiaTabBar extends StatefulWidget implements PreferredSizeWidget {
  /// {@template eufemia.components.EufemiaTabBar.tabs}
  /// A list of [EufemiaTab] to be layed out as children.
  /// Note: the list object will be modified and will therefore not pass any
  /// equality checks by refrence.
  /// {@endtemplate}
  final List<EufemiaTab> tabs;

  /// {@template  flutter.widgets.TabController}
  /// Coordinates tab selection between a [TabBar] and a [TabBarView].
  ///
  /// The index property is the index of the selected tab and the [animation]
  /// represents the current scroll positions of the tab bar and the tab bar view.
  /// The selected tab's index can be changed with [animateTo].
  ///
  /// A stateful widget that builds a [TabBar] or a [TabBarView] can create
  /// a [TabController] and share it directly.
  ///
  /// When the [TabBar] and [TabBarView] don't have a convenient stateful
  /// ancestor, a [TabController] can be shared by providing a
  /// [DefaultTabController] inherited widget.
  ///
  /// {@animation 700 540 https://flutter.github.io/assets-for-api-docs/assets/material/tabs.mp4}
  /// {@endtemplate}
  final TabController controller;

  /// {@macro eufemia.spacing.insets}
  final EufemiaInsets padding;

  /// If the tab bar is scrollable or not. Defaults to true.
  final bool isScrollable;

  EufemiaTabBar({
    Key key,
    this.tabs,
    this.controller,
    this.isScrollable = true,
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

    return bar;
  }
}
