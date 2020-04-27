import 'package:eufemia/eufemia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogService {
  static void showAlertDialog(
    BuildContext context, {
    String title,
    Widget content,
    List<DialogAction> actions,
  }) {
    if (context.cupertino) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(
            title,
            style: TextStyle(
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w600,
            ),
          ),
          content: AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 250),
            child: content,
            style: TextStyle(
              fontFamily: 'SF Pro Text',
            ),
          ),
          actions: actions?.map((action) {
                return CupertinoDialogAction(
                  child: Text(
                    action.label,
                    style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: context.bright
                          ? EufemiaColors.seaGreenAlt
                          : EufemiaColors.mintGreen,
                    ),
                  ),
                  onPressed: action.onPressed,
                  isDefaultAction: action.isDefaultAction,
                  isDestructiveAction: action.isDestructiveAction,
                );
              })?.toList() ??
              [],
        ),
      );
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(title),
              content: content,
              actions: actions.map((action) {
                return FlatButton(
                  child: Text(
                    action.label,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: context.bright ? EufemiaColors.seaGreenAlt : null,
                    ),
                  ),
                  onPressed: action.onPressed,
                );
              }).toList(),
            );
          });
    }
  }
}
