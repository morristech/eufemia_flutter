import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class SystemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('System'),
        leading: IconButton(
          icon: Icon(EufemiaIcons.back_arrow),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: ScrollableList(
          children: [
            Cell(
              title: Text('Show alert dialog'),
              onTap: () => _showAlertDialog(context),
            ),
            Cell(
              title: Text('Show single action dialog'),
              onTap: () => _showSingleActionDialog(context),
            ),
            Cell(
              title: Text('Show action sheet'),
              onTap: () => _showActionSheet(context),
            ),
            Cell(
              title: Text('Show bottom sheet'),
              onTap: () => _showBottomSheet(context),
            ),
            Cell(
              title: Text('Show picker'),
              onTap: () => _showPicker(context),
            ),
          ],
        ),
      ),
    );
  }

  void _showPicker(BuildContext context) {
    PickerService.showPicker(
      context,
      onValueChanged: (index) => print(index),
      actions: [
        PickerAction(label: 'Option 1'),
        PickerAction(label: 'Option 2'),
        PickerAction(label: 'Option 3'),
        PickerAction(label: 'Option 4', selected: true),
        PickerAction(label: 'Option 5'),
        PickerAction(label: 'Option 6'),
        PickerAction(label: 'Option 7'),
      ],
    );
  }

  void _showSingleActionDialog(BuildContext context) {
    DialogService.showAlertDialog(
      context,
      title: 'Alert',
      content: 'This is an alert dialog',
      actions: [
        DialogAction(
          label: 'Button',
          isDefaultAction: true,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  void _showAlertDialog(BuildContext context) {
    DialogService.showAlertDialog(
      context,
      title: 'Alert',
      content: 'This is an alert dialog',
      actions: [
        DialogAction(
          label: 'Button',
          onPressed: () => Navigator.pop(context),
        ),
        DialogAction(
          label: 'Button',
          isDefaultAction: true,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  void _showBottomSheet(BuildContext context) {}

  void _showActionSheet(BuildContext context) {
    BottomSheetService.showActionsSheet(
      context,
      title: 'A short description of the action goes here',
      actions: [
        ModalAction(
          label: 'Action',
          onPressed: () => Navigator.pop(context),
        ),
        ModalAction(
          label: 'Action',
          onPressed: () => Navigator.pop(context),
        ),
        ModalAction(
          label: 'Action',
          onPressed: () => Navigator.pop(context),
        ),
        ModalAction(
          label: 'Action',
          onPressed: () => Navigator.pop(context),
        ),
        ModalAction(
          label: 'Disabled action',
          enabled: false,
          onPressed: () => Navigator.pop(context),
        ),
        ModalAction(
          label: 'Default action',
          isDefault: true,
          onPressed: () => Navigator.pop(context),
        ),
        ModalAction(
          label: 'Destructive action',
          isDestructive: true,
          onPressed: () => Navigator.pop(context),
        ),
      ],
      cancel: ModalAction(
        label: 'Cancel',
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
