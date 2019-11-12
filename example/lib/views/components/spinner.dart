import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class SpinnerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(EufemiaIcons.back_arrow),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Spinner'),
      ),
      body: Center(
        child: Spinner(),
      ),
    );
  }
}
