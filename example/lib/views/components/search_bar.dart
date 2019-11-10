import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class SearchBarView extends StatefulWidget {
  @override
  _SearchBarViewState createState() => _SearchBarViewState();
}

class _SearchBarViewState extends State<SearchBarView> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search bar'),
        leading: IconButton(
          icon: Icon(EufemiaIcons.back_arrow),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: ScrollableList(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SearchBar(
                controller: _controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
