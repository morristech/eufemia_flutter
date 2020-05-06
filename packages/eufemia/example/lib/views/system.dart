import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class SystemView extends StatefulWidget {
  @override
  _SystemViewState createState() => _SystemViewState();
}

class _SystemViewState extends State<SystemView> {
  int selectedPickerItem;

  @override
  void initState() {
    super.initState();
    selectedPickerItem = 0;
  }

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
              subtitle: Text('To be implemented'),
              onTap: () => _showBottomSheet(context),
            ),
            Cell(
              title: Text('Show picker'),
              subtitle: Text('Cupertino only'),
              trailing: Text('Selected: ${selectedPickerItem + 1}'),
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
      onValueChanged: (index) => setState(() => selectedPickerItem = index),
      controller: FixedExtentScrollController(initialItem: selectedPickerItem),
      actions: List.generate(
        8,
        (index) => PickerAction(
          label: 'Option ${index + 1}',
          selected: selectedPickerItem == index,
        ),
      ),
    );
  }

  void _showSingleActionDialog(BuildContext context) {
    DialogService.showAlertDialog(
      context,
      title: 'Alert',
      content: Text('This is an alert dialog'),
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
      content: Text('This is an alert dialog'),
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
      message: 'Some message to explain some more detailed information',
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
          isDefaultAction: true,
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
