import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class BarsView extends StatefulWidget {
  @override
  _BarsViewState createState() => _BarsViewState();
}

class _BarsViewState extends State<BarsView> with TickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  List<Widget> get tabs {
    final typography = EufemiaTypography.of(context);

    return List.generate(4, (index) {
      return EufemiaPadding.medium(
        child: Center(
          child: EufemiaText(
            'Tab ${index + 1}',
            style: typography.styles.titleMediumEmphasized,
          ),
        ),
      );
    });
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
          Container(
            height: 100,
            child: TabBarView(
              children: tabs,
              controller: tabController,
            ),
          ),
          BottomBar(
            controller: tabController,
            inactive: [
              Icon(EufemiaIcons.p2p),
              Icon(EufemiaIcons.p2p),
              Icon(EufemiaIcons.p2p),
              Icon(EufemiaIcons.p2p),
            ],
            active: [
              Icon(EufemiaIcons.p2p),
              Icon(EufemiaIcons.p2p),
              Icon(EufemiaIcons.p2p),
              Icon(EufemiaIcons.p2p),
            ],
            labels: [
              Text('Label'),
              Text('Label'),
              Text('Label'),
              Text('Label'),
            ],
            onSelected: (index) {
              tabController.animateTo(index);
              setState(() {});
            },
          ),
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
        ],
      ),
    );
  }
}
