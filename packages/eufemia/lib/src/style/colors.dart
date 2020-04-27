import 'package:flutter/material.dart';

class EufemiaColors {
  // Primary colors
  static const seaGreen = Color.fromARGB(255, 0, 114, 114);
  static const seaGreenAlt = Color.fromARGB(255, 0, 132, 132);
  static const oceanGreen = Color.fromARGB(255, 0, 52, 62);
  static const emeraldGreen = Color.fromARGB(255, 20, 85, 90);
  static const summerGreen = Color.fromARGB(255, 40, 180, 130);
  static const mintGreen = Color.fromARGB(255, 165, 225, 210);
  static const mintGreenAlt = Color.fromARGB(255, 235, 255, 250);

  // Accent / UX
  static const signalOrange = Color.fromARGB(255, 255, 84, 0);
  static const accentYellow = Color.fromARGB(255, 253, 187, 49);
  static const successGreen = Color.fromRGBO(0, 128, 0, 1);
  static const fireRed = Color.fromRGBO(220, 42, 42, 1);
  static const emberRed = Color(0xFFFCEEE);

  // Background
  static const lightGray = Color.fromRGBO(250, 250, 250, 1);
  static const lavender = Color.fromRGBO(242, 242, 245, 1);
  static const sandYellow = Color.fromRGBO(251, 246, 236, 1);
  static const pistachio = Color.fromRGBO(242, 244, 236, 1);

  // Color blends
  static const signalYellowDark = Color.fromARGB(255, 192, 192, 92);
  static const seaGreenAltDark = Color.fromARGB(255, 3, 107, 111);
  static const seaGreenAltLight = Color.fromARGB(255, 128, 192, 193);
  static const seaGreenAltShadow = Color.fromRGBO(0, 132, 132, 0.3);

  // Grayscale
  // In lack of better name
  static const darkModeCard = Color.fromRGBO(27, 28, 30, 1);
  static const coal = Color.fromARGB(255, 51, 51, 51);
  static const darkGray = Color.fromARGB(255, 117, 117, 117);
  static const softGray = Color.fromARGB(255, 204, 204, 204);
  static const outlineGray = Color.fromARGB(255, 235, 235, 235);
  static const lightShadow = Color.fromRGBO(51, 51, 51, 0.08);
  static const subtleGray = Color(0xFFF8F8F8);

  // Tertiary
  static const indigo = Color.fromARGB(255, 35, 25, 90);
  static const violet = Color.fromARGB(255, 110, 35, 130);
  static const skyBlue = Color.fromARGB(255, 75, 190, 210);

  // Card colors
  static const sagaGold = Color(0xFFC6B27F);
  static const sagaContrast = Color(0xFF807045);
  static const matteBlack = Color(0xFF262626);
  static const sand = Color(0xFFFFF5DB);
  static const sagaPb = Color(0xFF222222);

  // Dark mode colors
  static const gray1 = Color(0xFF8E8E93);
  static const gray2 = Color(0xFF636366);
  static const gray3 = Color(0xFF48484A);
  static const gray4 = Color(0xFF3A3A3C);
  static const gray5 = Color(0xFF2C2C2E);
  static const gray6 = Color(0xFF1C1C1E);

  static const all = [
    seaGreen,
    seaGreenAlt,
    oceanGreen,
    emeraldGreen,
    summerGreen,
    mintGreen,
    mintGreenAlt,
    signalOrange,
    accentYellow,
    successGreen,
    fireRed,
    lightGray,
    lavender,
    sandYellow,
    pistachio,
    signalYellowDark,
    seaGreenAltDark,
    seaGreenAltLight,
    seaGreenAltShadow,
    darkModeCard,
    coal,
    darkGray,
    softGray,
    outlineGray,
    lightShadow,
    subtleGray,
    indigo,
    violet,
    skyBlue,
    sagaGold,
    matteBlack,
    emberRed,
    gray1,
    gray2,
    gray3,
    gray4,
    gray5,
    gray6,
  ];

  static Map<Color, String> map = {
    seaGreen: 'Sea Green',
    seaGreenAlt: 'Sea Green Alt',
    oceanGreen: 'Ocean Green',
    emeraldGreen: 'Emerald Green',
    summerGreen: 'Summer Green',
    mintGreen: 'Mint Green',
    mintGreenAlt: 'Mint Green Alt',
    signalOrange: 'Signal Orange',
    accentYellow: 'Accent Yellow',
    successGreen: 'Success Green',
    fireRed: 'Fire Red',
    lightGray: 'Light Gray',
    lavender: 'Lavender',
    sandYellow: 'Sand Yellow',
    pistachio: 'Pistachio',
    signalYellowDark: 'Signal Yellow Dark',
    seaGreenAltDark: 'Sea Green Alt Dark',
    seaGreenAltLight: 'Sea Green Alt Light',
    seaGreenAltShadow: 'Sea Green Alt Shadow',
    darkModeCard: 'Dark Mode Card',
    coal: 'Coal',
    darkGray: 'Dark Gray',
    softGray: 'Soft Gray',
    outlineGray: 'Outline Gray',
    lightShadow: 'Light Shadow',
    subtleGray: 'Subtle Gray',
    indigo: 'Indigo',
    violet: 'Violet',
    skyBlue: 'Sky Blue',
    sagaGold: 'Saga Gold',
    emberRed: 'Ember red',
    gray1: 'Gray 1',
    gray2: 'Gray 2',
    gray3: 'Gray 3',
    gray4: 'Gray 4',
    gray5: 'Gray 5',
    gray6: 'Gray 6',
  };

  static Color getForegroundColor(Color backgroundColor) {
    final value = backgroundColor.value;

    if (value == seaGreenAlt.value) {
      return Colors.white;
    } else if (value == oceanGreen.value) {
      return mintGreen;
    } else if (value == emeraldGreen.value) {
      return mintGreen;
    } else if (value == summerGreen.value) {
      return oceanGreen;
    } else if (value == mintGreen.value) {
      return emeraldGreen;
    } else if (value == accentYellow.value) {
      return oceanGreen;
    } else {
      return Colors.white;
    }
  }
}
