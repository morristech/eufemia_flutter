import 'package:eufemia/eufemia.dart';
import 'package:eufemia_example/home.dart';
import 'package:eufemia_example/routes.dart';
import 'package:eufemia_example/views/components/button.dart';
import 'package:eufemia_example/views/components/checkbox.dart';
import 'package:eufemia_example/views/components/radio.dart';
import 'package:eufemia_example/views/components/components.dart';
import 'package:eufemia_example/views/components/section.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eufemia Example',
      theme: Eufemia.lightTheme,
      home: HomeView(),
      routes: {
        Routes.components: (context) => ComponentsView(),
        Routes.button: (context) => ButtonView(),
        Routes.checkbox: (context) => CheckboxView(),
        Routes.radio: (context) => RadioView(),
        Routes.section: (context) => SectionView(),
      },
    );
  }
}
