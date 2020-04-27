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
      body: ListView(
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
        ]
            .map((e) => Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                    top: 8.0,
                  ),
                  child: e,
                ))
            .toList(),
      ),
    );
  }
}
