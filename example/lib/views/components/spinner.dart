import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class SpinnerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: Text('Spinner'),
      ),
      body: Center(
        child: Spinner(),
      ),
    );
  }
}
