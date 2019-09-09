import 'package:eufemia/eufemia.dart';
import 'package:eufemia_example/routes.dart';
import 'package:flutter/material.dart';

class ComponentsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EufemiaAppBars.standard(
        title: 'Components',
        onBackPressed: () => Navigator.pop(context),
      ),
      body: EufemiaListView(
        children: [
          ListTile(
            title: Text('Button'),
            onTap: () => Navigator.pushNamed(context, Routes.button),
          ),
          ListTile(
            title: Text('Checkbox'),
            onTap: () => Navigator.pushNamed(context, Routes.checkbox),
          ),
          ListTile(
            title: Text('Radio'),
            onTap: () => Navigator.pushNamed(context, Routes.radio),
          ),
          ListTile(
            title: Text('Section'),
            onTap: () => Navigator.pushNamed(context, Routes.section),
          ),
          ListTile(
            title: Text('FormLabel'),
          ),
        ],
      ),
    );
  }
}
