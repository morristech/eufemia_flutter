import 'package:device_simulator/device_simulator.dart';
import 'package:eufemia/eufemia.dart';
import 'package:eufemia_example/home.dart';
import 'package:eufemia_example/routes.dart';
import 'package:eufemia_example/views/buttons.dart';
import 'package:eufemia_example/views/components.dart';
import 'package:eufemia_example/views/components/bars.dart';
import 'package:eufemia_example/views/components/cards.dart';
import 'package:eufemia_example/views/components/cells.dart';
import 'package:eufemia_example/views/components/icons.dart';
import 'package:eufemia_example/views/components/search_bar.dart';
import 'package:eufemia_example/views/components/controls.dart';
import 'package:eufemia_example/views/components/snackbars.dart';
import 'package:eufemia_example/views/graphics/flags.dart';
import 'package:eufemia_example/views/graphics/graphics.dart';
import 'package:eufemia_example/views/graphics/graphics_cards.dart';
import 'package:eufemia_example/views/graphics/logos.dart';
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
      home: DeviceSimulator(child: HomeView()),
      routes: {
        Routes.components: (context) => DeviceSimulator(child: ComponentView()),
        Routes.buttons: (context) => DeviceSimulator(child: ButtonsView()),
        Routes.search_bars: (context) => DeviceSimulator(child: SearchBarView()),
        Routes.cards: (context) => DeviceSimulator(child: CardsView()),
        Routes.controls: (context) => DeviceSimulator(child: ControlsView()),
        Routes.snackbars: (context) => DeviceSimulator(child: SnackbarsView()),
        Routes.cells: (context) => DeviceSimulator(child: CellsView()),
        Routes.graphics: (context) => DeviceSimulator(child: GraphicsView()),
        Routes.logos: (context) => DeviceSimulator(child: LogosView()),
        Routes.flags: (context) => DeviceSimulator(child: FlagsView()),
        Routes.graphics_cards: (context) => DeviceSimulator(child: GraphicsCardsView()),
        Routes.bars: (context) => DeviceSimulator(child: BarsView()),
        Routes.icons: (context) => DeviceSimulator(child: IconsView()),
      },
    );
  }
}
