import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class SectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EufemiaAppBars.standard(
        title: 'Section',
        onBackPressed: () => Navigator.pop(context),
      ),
      body: EufemiaListView(
        padding: EdgeInsets.only(top: 16.0),
        spacing: 16.0,
        alignment: Alignment.centerLeft,
        children: [
          EufemiaSection(
            child: _buildText('default'),
            spacing: false,
          ),
          EufemiaSection(
            child: _buildText('default with spacing'),
            spacing: true,
          ),
          EufemiaSection(
            child: _buildText('white'),
            spacing: true,
            color: EufemiaColors.white,
          ),
          EufemiaSection(
            child: _buildText('white with divider'),
            spacing: true,
            dividers: true,
            color: EufemiaColors.white,
          ),
          EufemiaSection(
            child: _buildText('mint-green'),
            spacing: true,
            color: EufemiaColors.mintGreen,
          ),
          EufemiaSection(
            child: _buildText(
              'emerald-green',
              color: EufemiaColors.mintGreen,
            ),
            spacing: true,
            color: EufemiaColors.emeraldGreen,
          ),
          EufemiaSection(
            child: _buildText('signal-orange'),
            spacing: true,
            color: EufemiaColors.signalOrange,
          ),
          EufemiaSection(
            child: _buildText(
              'cherry-red',
              color: EufemiaColors.white,
            ),
            spacing: true,
            color: EufemiaColors.cherryRed,
          ),
        ],
      ),
    );
  }

  Widget _buildText(String text, {Color color}) {
    return Text.rich(
      TextSpan(
        text: 'Visual DNB section: ',
        style: color != null ? TextStyle(color: color) : null,
        children: [
          WidgetSpan(
            child: Container(
              padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.5),
                color: EufemiaColors.mintGreenAlt,
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: 'Menlo-Regular',
                  color: EufemiaColors.charcoalGrey,
                ),
              ),
            ),
          ),
          /*TextSpan(
            text: text,
            style: TextStyle(
              fontFamily: 'Menlo-Regular',
              color: EufemiaColors.charcoalGrey,
              backgroundColor: EufemiaColors.mintGreenAlt,
            ),
          ),*/
        ],
      ),
    );
  }
}
