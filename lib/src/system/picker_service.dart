import 'dart:io';

import 'package:eufemia/eufemia.dart';
import 'package:eufemia/src/system/picker_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double _pickerSheetHeight = 216.0;

class PickerService {
  static void showPicker(
    BuildContext context, {
    ValueChanged<int> onValueChanged,
    List<PickerAction> actions,
    double itemExtent = 32.0,
    bool looping = false,
  }) {
    if (Platform.isIOS) {
      showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return Container(
              height: _pickerSheetHeight,
              child: CupertinoPicker(
                backgroundColor: Theme.of(context).cardColor,
                onSelectedItemChanged: onValueChanged,
                itemExtent: itemExtent,
                children: actions.map((action) {
                  return Text(
                    action.label,
                    style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      letterSpacing: 1.18,
                      fontSize: 17.0,
                      fontWeight: action.selected ? FontWeight.bold : null,
                      height: 1.18,
                      color: EufemiaColors.seaGreenAlt,
                    ),
                  );
                }).toList(),
              ),
            );
          });
    } else {}
  }
}
