import 'package:eufemia/src/style/colors.dart';
import 'package:eufemia/src/style/constants.dart';
import 'package:flutter/widgets.dart';

class EufemiaBorders {

  static BorderSide get divider {
    return BorderSide(
      color: EufemiaColors.mintGreen,
      width: EufemiaConstants.borderWidthThin,
    );
  }
  static Border get standard {
    return Border.all(
      color: EufemiaColors.emeraldGreen,
      width: EufemiaConstants.borderWidth,
    );
  }

  static Border get thin {
    return Border.all(
      color: EufemiaColors.emeraldGreen,
      width: EufemiaConstants.borderWidthThin,
    );
  }

  static Border get invisibleThin {
    return Border.all(
      color: EufemiaColors.transparent,
      width: EufemiaConstants.borderWidthThin,
    );
  }

  static Border get invisible {
    return Border.all(
      color: EufemiaColors.transparent,
      width: EufemiaConstants.borderWidth,
    );
  }

  static Border get error {
    return Border.all(
      color: EufemiaColors.cherryRed,
      width: EufemiaConstants.borderWidth,
    );
  }

  static Border get errorThin {
    return Border.all(
      color: EufemiaColors.cherryRed,
      width: EufemiaConstants.borderWidthThin,
    );
  }

  static Border get warning {
    return Border.all(
      color: EufemiaColors.signalYellow,
      width: EufemiaConstants.borderWidth,
    );
  }

  static Border get warningThin {
    return Border.all(
      color: EufemiaColors.signalYellow,
      width: EufemiaConstants.borderWidthThin,
    );
  }

  static Border get mint {
    return Border.all(
      color: EufemiaColors.mintGreen,
      width: EufemiaConstants.borderWidth,
    );
  }
}
