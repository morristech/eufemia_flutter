import 'package:eufemia/eufemia.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Eufemia {
  static get lightTheme {
    return ThemeData(
      fontFamily: 'FedraSansStd',
      primaryColor: EufemiaColors.white,
      appBarTheme: AppBarTheme(
        textTheme: TextTheme(
          title: TextStyle(
            fontFamily: 'FedraSansStd',
            color: EufemiaColors.black,
            fontSize: 18,
          ),
        ),
        iconTheme: IconThemeData(
          color: EufemiaColors.black,
        ),
      ),
      textTheme: TextTheme(
        title: TextStyle(
          color: EufemiaColors.black,
        ),
        subtitle: TextStyle(),
        caption: TextStyle(),
        display1: TextStyle(),
        display2: TextStyle(),
        display3: TextStyle(
          color: EufemiaColors.emeraldGreen,
        ),
        display4: TextStyle(
          color: EufemiaColors.emeraldGreen,
        ),
        subhead: TextStyle(
          color: EufemiaColors.emeraldGreen,
          fontWeight: FontWeight.w500,
        ),
        body1: TextStyle(),
        body2: TextStyle(
          color: EufemiaColors.emeraldGreen,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: EufemiaColors.seaGreen,
      ),
    );
  }

  static get darkTheme {
    return ThemeData(
      fontFamily: 'FedraSansStd',
      primaryColor: EufemiaColors.emeraldGreen,
      accentColor: EufemiaColors.mintGreen,
      canvasColor: EufemiaColors.emeraldGreen,
      appBarTheme: AppBarTheme(
        textTheme: TextTheme(
          title: TextStyle(
            fontFamily: 'FedraSansStd',
            color: EufemiaColors.mintGreen,
            fontSize: 18,
          ),
        ),
        iconTheme: IconThemeData(
          color: EufemiaColors.mintGreen,
        ),
      ),
      textTheme: TextTheme(
        title: TextStyle(
          color: EufemiaColors.mintGreen,
        ),
        subtitle: TextStyle(
          color: EufemiaColors.mintGreen,
        ),
        caption: TextStyle(
          color: EufemiaColors.mintGreen,
        ),
        display1: TextStyle(
          color: EufemiaColors.mintGreen,
        ),
        display2: TextStyle(
          color: EufemiaColors.mintGreen,
        ),
        display3: TextStyle(
          color: EufemiaColors.mintGreen,
        ),
        display4: TextStyle(
          color: EufemiaColors.mintGreen,
        ),
        subhead: TextStyle(
          color: EufemiaColors.mintGreen,
        ),
        body1: TextStyle(
          color: EufemiaColors.mintGreen,
        ),
        body2: TextStyle(
          color: EufemiaColors.mintGreen,
        ),
      ),
    );
  }
}
