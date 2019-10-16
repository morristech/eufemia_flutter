import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class GraphicsCardsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        children: [
          Wrap(
            direction: Axis.horizontal,
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
            ]
                .map(
                  (i) => Padding(
                    padding: EdgeInsets.all(8.0),
                    child: i,
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
