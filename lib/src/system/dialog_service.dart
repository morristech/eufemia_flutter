import 'package:eufemia/eufemia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogService {
  static void showAlertDialog(
    BuildContext context, {
    String title,
    String content,
    List<DialogAction> actions,
  }) {
    if (context.cupertino) {
      showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(
            title,
            style: TextStyle(
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Text(
            content,
            style: TextStyle(
              fontFamily: 'SF Pro Text',
            ),
          ),
          actions: actions.map((action) {
            return CupertinoDialogAction(
              child: Text(
                action.label,
                style: TextStyle(
                  fontFamily: 'SF Pro Text',
                  color: EufemiaColors.seaGreenAlt,
                ),
              ),
              onPressed: action.onPressed,
              isDefaultAction: action.isDefaultAction,
              isDestructiveAction: action.isDestructiveAction,
            );
          }).toList(),
        ),
      );
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(title),
              content: Text(content),
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
