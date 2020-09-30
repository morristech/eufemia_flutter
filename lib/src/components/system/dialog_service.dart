import 'package:eufemia/components.dart';
import 'package:eufemia/palette.dart';
import 'package:eufemia/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TODO (@arnemolland): Refactor to a more simplistic API
/// {@category Components}
/// {@subCategory System}
/// A wrapper around helper methods for showing system dialogs.
class DialogService {
  /// Displays an alert dialog as an overlay.
  static void showAlertDialog(
    BuildContext context, {
    String title,
    Widget content,
    List<DialogAction> actions,
  }) {
    final typography = EufemiaTypography.of(context);
    final palette = EufemiaPalette.of(context);

    if (context.cupertino) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(
            title,
            style:
                typography.styles.bodyEmphasized.toTextStyle(context).copyWith(
                      fontFamily: 'SF Pro Text',
                      letterSpacing: -.408,
                    ),
          ),
          content: DefaultTextStyle(
            child: content,
            textAlign: TextAlign.center,
            style: typography.styles.body.toTextStyle(context).copyWith(
                  fontFamily: 'SF Pro Text',
                  letterSpacing: -.078,
                ),
          ),
          actions: actions?.map(
                (action) {
                  final style = action.isDefaultAction
                      ? typography.styles.buttonEmphasized
                      : typography.styles.button;

                  return CupertinoDialogAction(
                    child: Text(
                      action.label,
                      style: style.toTextStyle(context).copyWith(
                            fontFamily: 'SF Pro Text',
                            color: palette.button,
                          ),
                    ),
                    onPressed: action.onPressed,
                    isDefaultAction: action.isDefaultAction,
                    isDestructiveAction: action.isDestructiveAction,
                  );
                },
              )?.toList() ??
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
