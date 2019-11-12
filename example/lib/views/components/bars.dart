import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class BarsView extends StatefulWidget {
  @override
  _BarsViewState createState() => _BarsViewState();
}

class _BarsViewState extends State<BarsView> with TickerProviderStateMixin {
  TabController _tabController1;
  TabController _tabController2;
  TabController _tabController3;
  TabController _tabController4;

  @override
  void initState() {
    super.initState();
    _tabController1 = TabController(vsync: this, length: 4);
    _tabController2 = TabController(vsync: this, length: 4);
    _tabController3 = TabController(vsync: this, length: 4);
    _tabController4 = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bars'),
        leading: IconButton(
          icon: Icon(EufemiaIcons.back_arrow),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ScrollableList(
        showBorders: false,
        children: [
          Toolbar(
            children: [
              Icon(EufemiaIcons.pencil),
            ],
          ),
          Toolbar(
            children: [
              Icon(EufemiaIcons.cog),
              Icon(EufemiaIcons.pencil),
            ],
          ),
          Toolbar(
            children: [
              Icon(EufemiaIcons.cog),
              Icon(EufemiaIcons.information),
              Icon(EufemiaIcons.pencil),
            ],
          ),
          Toolbar(
            children: [
              Icon(EufemiaIcons.cog),
              Icon(EufemiaIcons.information),
              Icon(EufemiaIcons.download),
              Icon(EufemiaIcons.pencil),
            ],
          ),
          Toolbar(
            children: [
              Icon(EufemiaIcons.cog),
              Icon(EufemiaIcons.information),
              Icon(EufemiaIcons.filter),
              Icon(EufemiaIcons.download),
              Icon(EufemiaIcons.pencil),
            ],
          ),
          _createBottomBar(_tabController1, TabTheme.light),
          _createBottomBar(_tabController2, TabTheme.dark),
          _createBottomBar(_tabController3, TabTheme.privateBanking),
          _createBottomBar(_tabController4, TabTheme.saga),
        ],
      ),
    );
  }

  Widget _createBottomBar(TabController controller, TabTheme theme) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: TabBarView(
              controller: controller,
              children: [1, 2, 3, 4]
                  .map((i) => Center(
                        child: Text('Tab $i'),
                      ))
                  .toList(),
            ),
          ),
          BottomTabBar(
            controller: controller,
            theme: theme,
            icons: [
              TabIcon.house,
              TabIcon.wallet,
              TabIcon.coins,
              TabIcon.person,
            ],
          ),
        ],
      ),
    );
  }
}
