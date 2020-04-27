import 'package:eufemia/eufemia.dart';
import 'package:eufemia_example/home.dart';
import 'package:eufemia_example/routes.dart';
import 'package:eufemia_example/views/buttons.dart';
import 'package:eufemia_example/views/components.dart';
import 'package:eufemia_example/views/components/bars.dart';
import 'package:eufemia_example/views/components/cards.dart';
import 'package:eufemia_example/views/components/cells.dart';
import 'package:eufemia_example/views/components/input_fields.dart';
import 'package:eufemia_example/views/components/controls.dart';
import 'package:eufemia_example/views/components/message_boxes.dart';
import 'package:eufemia_example/views/components/snackbars.dart';
import 'package:eufemia_example/views/components/spinner.dart';
import 'package:eufemia_example/views/graphics/flags.dart';
import 'package:eufemia_example/views/graphics/graphics.dart';
import 'package:eufemia_example/views/graphics/payment_cards.dart';
import 'package:eufemia_example/views/graphics/logos.dart';
import 'package:eufemia_example/views/icons.dart';
import 'package:eufemia_example/views/system.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Eufemia(
      data: EufemiaData(
        typography: EufemiaTypographyData.fallback(),
        palette: EufemiaPaletteData.regular(),
        spacing: EufemiaSpacingData.fallback(),
        button: EufemiaButtonThemeData.fallback(),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Eufemia',
        theme: EufemiaTheme.lightTheme(),
        darkTheme: EufemiaTheme.darkTheme(),
        home: HomeView(),
        routes: {
          Routes.components: (context) => ComponentView(),
          Routes.buttons: (context) => ButtonsView(),
          Routes.input_fields: (context) => InputFieldsView(),
          Routes.cards: (context) => CardsView(),
          Routes.controls: (context) => ControlsView(),
          Routes.snackbars: (context) => SnackbarsView(),
          Routes.cells: (context) => CellsView(),
          Routes.graphics: (context) => GraphicsView(),
          Routes.logos: (context) => LogosView(),
          Routes.flags: (context) => FlagsView(),
          Routes.graphics_cards: (context) => PaymentCardsView(),
          Routes.bars: (context) => BarsView(),
          Routes.icons: (context) => IconsView(),
          Routes.system: (context) => SystemView(),
          Routes.spinner: (context) => SpinnerView(),
          Routes.messageBoxes: (context) => MessageBoxesView(),
        },
      ),
    );
  }
}