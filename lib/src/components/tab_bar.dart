import 'package:flutter/material.dart';

const double _kTabHeight = 24.0;
const double _kTabIndicatorWeight = 2.0;

class TabBar extends StatefulWidget implements PreferredSizeWidget {
  final List<Widget> tabs;
  final TabController controller;

  const TabBar({
    Key key,
    @required this.tabs,
    this.controller,
  }) : super(key: key);

  @override
  _TabBarState createState() => _TabBarState();

  @override
  Size get preferredSize => Size.fromHeight(_kTabHeight);
}

class _TabBarState extends State<TabBar> {
  List<GlobalKey> _tabKeys;

  @override
  void initState() {
    super.initState();
    _tabKeys = widget.tabs.map((tab) => GlobalKey()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.tabs,
    );
  }
}
