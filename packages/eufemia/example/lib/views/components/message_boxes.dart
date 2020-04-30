import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class MessageBoxesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message boxes'),
        leading: IconButton(
          icon: Icon(EufemiaIcons.back_arrow),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: EufemiaColumn(
        spaceBetween: EufemiaSpace.small,
        padding: EufemiaInsets.allSmall,
        children: [
          MessageBox.info(
            'Visste du at du kan sveipe på en transaksjon og utføre visse handlinger?',
          ),
          MessageBox.warning(
            'Betalingen ble stoppet. Det var ikke nok penger på kontoen.',
          ),
          MessageBox.error(
            'Kunne ikke gjennomføre betalingen fordi DNBs kjernesystemer står i brann.',
          ),
          MessageBox.info(
            'Visste du at du kan sveipe på en transaksjon og utføre visse handlinger?',
            onTap: () {},
          ),
          MessageBox.warning(
            'Betalingen ble stoppet. Det var ikke nok penger på kontoen.',
            onTap: () {},
          ),
          MessageBox.error(
            'Kunne ikke gjennomføre betalingen fordi DNBs kjernesystemer står i brann.',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
