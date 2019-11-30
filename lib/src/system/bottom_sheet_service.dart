import 'package:eufemia/eufemia.dart';
import 'package:eufemia/src/system/modal_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetService {
  /// Shows a native modal bottom sheet in the given [BuildContext]
  static void showNativeBottomSheet(
      BuildContext context, WidgetBuilder builder) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      showCupertinoModalPopup(
        context: context,
        builder: builder,
      );
    } else {
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: builder,
      );
    }
  }

  /// Shows a native modal bottom sheet with the given [ModalAction] list
  static void showActionsSheet(
    BuildContext context, {
    @required String title,
    @required String message,
    @required ModalAction cancel,
    @required List<ModalAction> actions,
  }) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      showNativeBottomSheet(
        context,
        (context) {
          return CupertinoActionSheet(
            actions: actions.map(
              (action) {
                return CupertinoActionSheetAction(
                  onPressed: action.onPressed,
                  isDefaultAction: action.isDefaultAction,
                  isDestructiveAction: action.isDestructive,
                  child: Text(
                    action.label,
                    style: Eufemia.buttonLarge.copyWith(
                      color: action.enabled
                          ? (action.isDestructive
                              ? Color(0xFFFF3B30)
                              : EufemiaColors.seaGreenAlt)
                          : EufemiaColors.darkGray,
                      fontFamily: 'SF Pro Text',
                    ),
                  ),
                );
              },
            ).toList(),
            title: Text(title),
            message: Text(message),
            cancelButton: CupertinoActionSheetAction(
              onPressed: cancel.onPressed,
              isDefaultAction: cancel.isDefaultAction,
              isDestructiveAction: cancel.isDestructive,
              child: Text(
                cancel.label,
                style: Eufemia.buttonLarge.copyWith(
                  color: EufemiaColors.seaGreenAlt,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      );
    } else {
      showNativeBottomSheet(
        context,
        (context) {
          return Material(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: ScrollableList(
              shrinkWrap: true,
              children: [
                Cell(
                  title: Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                ...actions.map(
                  (action) {
                    return Cell(
                      leading: action.icon != null
                          ? Icon(
                              action.icon,
                              color: action.enabled
                                  ? (action.isDestructive
                                      ? Color(0xFFFF3B30)
                                      : EufemiaColors.seaGreenAlt)
                                  : EufemiaColors.darkGray,
                            )
                          : null,
                      title: Text(
                        action.label,
                        style: TextStyle(
                          color: EufemiaColors.seaGreenAlt,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      onTap: action.onPressed,
                    );
                  },
                )
              ],
            ),
          );
        },
      );
    }
  }
}
