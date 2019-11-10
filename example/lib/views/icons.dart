import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(EufemiaIcons.back_arrow),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Icons'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: [
          Wrap(
            children: [
              Icon(EufemiaIcons.add),
              Icon(EufemiaIcons.alert),
              Icon(EufemiaIcons.alert_1),
              Icon(EufemiaIcons.back_arrow),
              Icon(EufemiaIcons.bell),
              Icon(EufemiaIcons.calendar),
              Icon(EufemiaIcons.checkmark),
              Icon(EufemiaIcons.chevron),
              Icon(EufemiaIcons.chevron_small),
              Icon(EufemiaIcons.clear, color: EufemiaColors.darkGray),
              Icon(EufemiaIcons.close),
              Icon(EufemiaIcons.cog),
              Icon(EufemiaIcons.dismiss),
              Icon(EufemiaIcons.download),
              Icon(EufemiaIcons.filter),
              Icon(EufemiaIcons.forward_arrow),
              Icon(EufemiaIcons.grabber),
              Icon(EufemiaIcons.hide),
              Icon(EufemiaIcons.house),
              Icon(EufemiaIcons.information),
              Icon(EufemiaIcons.information_small),
              Icon(EufemiaIcons.launch),
              Icon(EufemiaIcons.location),
              Icon(EufemiaIcons.loupe),
              Icon(EufemiaIcons.more),
              Icon(EufemiaIcons.pencil),
              Icon(EufemiaIcons.person),
              Icon(EufemiaIcons.questionmark),
              Icon(EufemiaIcons.share_android),
              Icon(EufemiaIcons.share_ios),
              Icon(EufemiaIcons.spinner),
              Icon(EufemiaIcons.swap),
              Icon(EufemiaIcons.trash),
              Icon(EufemiaIcons.type_indicator),
            ].map((i) => Padding(padding: const EdgeInsets.all(8.0), child: i)).toList(),
          ),
        ],
      ),
    );
  }
}
