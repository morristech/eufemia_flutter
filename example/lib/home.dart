import 'package:eufemia/eufemia.dart';
import 'package:eufemia_example/routes.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eufemia'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Buttons'),
            onTap: () => Navigator.pushNamed(context, Routes.buttons),
          ),
          ListTile(
            title: Text('Components'),
            onTap: () => Navigator.pushNamed(context, Routes.components),
          ),
        ],
      ),
      floatingActionButton: FAB(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
