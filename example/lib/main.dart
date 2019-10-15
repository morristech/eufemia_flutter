import 'package:eufemia/eufemia.dart';
import 'package:eufemia_example/home.dart';
import 'package:eufemia_example/routes.dart';
import 'package:eufemia_example/views/buttons.dart';
import 'package:eufemia_example/views/components.dart';
import 'package:eufemia_example/views/components/cards.dart';
import 'package:eufemia_example/views/components/search_bar.dart';
import 'package:eufemia_example/views/components/controls.dart';
import 'package:eufemia_example/views/components/snackbars.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eufemia',
      theme: Eufemia.lightTheme(),
      darkTheme: Eufemia.darkTheme(),
      home: HomeView(),
      routes: {
        Routes.components: (context) => ComponentView(),
        Routes.buttons: (context) => ButtonsView(),
        Routes.search_bars: (context) => SearchBarView(),
        Routes.cards: (context) => CardsView(),
        Routes.controls: (context) => ControlsView(),
        Routes.snackbars: (context) => SnackbarsView(),
      },
    );
  }
}
