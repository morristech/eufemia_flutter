import 'package:eufemia/eufemia.dart' as eufemia;
import 'package:flutter/material.dart';

class CardsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: eufemia.Card(
              child: Container(
                width: 80.0,
                height: 80.0,
                child: Center(
                  child: Text('Card'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: eufemia.Card(
              child: Container(
                width: 80.0,
                height: 80.0,
                child: Center(
                  child: Text('Card'),
                ),
              ),
              label: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text('Label'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
