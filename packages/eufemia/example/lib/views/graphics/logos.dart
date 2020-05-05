import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class LogosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logos'),
        leading: IconButton(
          icon: Icon(EufemiaIcons.back_arrow),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ScrollableList(
        showBorders: false,
        children: [
          EufemiaColumn(
            children: [
              EufemiaRow(
                padding: EufemiaInsets.allMedium,
                spaceBetween: EufemiaSpace.medium,
                children: [
                  Logo(LogoData.dnb),
                  Logo(LogoData.visa),
                  Logo(LogoData.mastercard),
                  Logo(LogoData.hbo),
                  Logo(LogoData.netflix),
                  Logo(LogoData.ruter),
                  Logo(LogoData.spotify),
                  Logo(LogoData.face_id),
                  Logo(LogoData.touch_id),
                  Logo(LogoData.bank_id_mobile),
                  Logo(LogoData.bank_id),
                  Logo(LogoData.digipass),
                  Logo(LogoData.pin),
                  Logo(LogoData.skyss),
                ],
              ),
              EufemiaRow(
                padding: EufemiaInsets.allMedium,
                spaceBetween: EufemiaSpace.medium,
                children: [
                  Logo.themed(LogoData.dnb),
                  Logo.themed(LogoData.visa),
                  Logo.themed(LogoData.mastercard),
                  Logo.themed(LogoData.hbo),
                  Logo.themed(LogoData.netflix),
                  Logo.themed(LogoData.ruter),
                  Logo.themed(LogoData.spotify),
                  Logo.themed(LogoData.face_id),
                  Logo.themed(LogoData.touch_id),
                  Logo.themed(LogoData.bank_id_mobile),
                  Logo.themed(LogoData.bank_id),
                  Logo.themed(LogoData.digipass),
                  Logo.themed(LogoData.pin),
                  Logo.themed(LogoData.skyss),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
