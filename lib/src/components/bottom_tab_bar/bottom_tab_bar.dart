import 'package:eufemia/src/components/bottom_tab_bar/tab_icon.dart';
import 'package:eufemia/src/components/bottom_tab_bar/tab_item.dart';
import 'package:eufemia/src/components/bottom_tab_bar/tab_theme.dart';
import 'package:eufemia/src/style/colors.dart';
import 'package:flutter/material.dart';

const double _tabHeight = 24.0;

class BottomTabBar extends StatefulWidget implements PreferredSizeWidget {
  final List<TabIcon> icons;
  final TabController controller;
  final TabTheme theme;

  const BottomTabBar({
    Key key,
    @required this.icons,
    this.controller,
    this.theme,
  }) : super(key: key);

  @override
  _BottomTabBarState createState() => _BottomTabBarState();

  @override
  Size get preferredSize => Size.fromHeight(_tabHeight);
}

class _BottomTabBarState extends State<BottomTabBar> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (widget.controller.indexIsChanging) {
        // Update the active widget
        setState(() {});
      }
    });
  }

  void _navigateTo(int index) {
    widget.controller.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: Theme.of(context).brightness == Brightness.light
                ? EufemiaColors.lightShadow
                : Colors.white.withOpacity(0.1),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.icons
            .map((icon) => GestureDetector(
                  onTap: () => _navigateTo(widget.icons.indexOf(icon)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 2.0),
                    child: TabItem(
                      active: widget.controller.index == widget.icons.indexOf(icon),
                      icon: icon,
                      theme: widget.theme ??
                          (Theme.of(context).brightness == Brightness.light
                              ? TabTheme.light
                              : TabTheme.dark),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
