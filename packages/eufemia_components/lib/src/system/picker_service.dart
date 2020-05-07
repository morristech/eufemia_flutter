import 'package:eufemia_components/eufemia_components.dart';
import 'package:eufemia_palette/eufemia_palette.dart';
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
    FixedExtentScrollController controller,
  }) {
    if (context.cupertino) {
      final palette = EufemiaPalette.of(context);
      controller ??= FixedExtentScrollController();

      showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
            height: _pickerSheetHeight,
            child: CupertinoPicker(
              backgroundColor: context.theme.bottomAppBarColor,
              onSelectedItemChanged: onValueChanged,
              itemExtent: itemExtent,
              scrollController: controller,
              children: actions.map(
                (action) {
                  return Center(
                    child: Text(
                      action.label,
                      style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        letterSpacing: 1.18,
                        fontSize: 17.0,
                        fontWeight: action.selected ? FontWeight.bold : null,
                        height: 1.18,
                        color: palette.secondary,
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          );
        },
      );
    } else {}
  }
}
