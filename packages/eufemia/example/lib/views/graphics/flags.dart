import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class FlagsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flags'),
        leading: IconButton(
          icon: Icon(EufemiaIcons.back_arrow),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ScrollableList(
        padding: EufemiaInsets.medium(EufemiaSides.vertical),
        children: [
          EufemiaWrap(
            direction: Axis.horizontal,
            children: [
              Flag(FlagData.ae),
              Flag(FlagData.au),
              Flag(FlagData.bg),
              Flag(FlagData.bh),
              Flag(FlagData.br),
              Flag(FlagData.bs),
              Flag(FlagData.bw),
              Flag(FlagData.ca),
              Flag(FlagData.ch),
              Flag(FlagData.cl),
              Flag(FlagData.cn),
              Flag(FlagData.cz),
              Flag(FlagData.dk),
              Flag(FlagData.dO),
              Flag(FlagData.eg),
              Flag(FlagData.et),
              Flag(FlagData.eu),
              Flag(FlagData.gb),
              Flag(FlagData.gm),
              Flag(FlagData.hk),
              Flag(FlagData.hr),
              Flag(FlagData.hu),
              Flag(FlagData.id),
              Flag(FlagData.il),
              Flag(FlagData.iN),
              Flag(FlagData.iS),
              Flag(FlagData.jo),
              Flag(FlagData.jp),
              Flag(FlagData.ke),
              Flag(FlagData.kr),
              Flag(FlagData.kw),
              Flag(FlagData.lk),
              Flag(FlagData.ma),
              Flag(FlagData.mk),
              Flag(FlagData.mu),
              Flag(FlagData.mv),
              Flag(FlagData.mx),
              Flag(FlagData.my),
              Flag(FlagData.no),
              Flag(FlagData.nz),
              Flag(FlagData.om),
              Flag(FlagData.ph),
              Flag(FlagData.pk),
              Flag(FlagData.pl),
              Flag(FlagData.qa),
              Flag(FlagData.ro),
              Flag(FlagData.rs),
              Flag(FlagData.ru),
              Flag(FlagData.sa),
              Flag(FlagData.se),
              Flag(FlagData.sg),
              Flag(FlagData.th),
              Flag(FlagData.tn),
              Flag(FlagData.tr),
              Flag(FlagData.tw),
              Flag(FlagData.tz),
              Flag(FlagData.us),
              Flag(FlagData.vn),
              Flag(FlagData.vu),
              Flag(FlagData.za),
            ]
                .map(
                  (i) => EufemiaPadding.small(child: i),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
