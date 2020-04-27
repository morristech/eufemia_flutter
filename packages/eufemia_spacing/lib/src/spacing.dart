import 'package:flutter/material.dart';

import 'package:eufemia_spacing/src/spacing_data.dart';

class EufemiaSpacing extends StatefulWidget {
  final EufemiaSpacingData data;
  final Widget child;

  const EufemiaSpacing({
    Key key,
    @required this.data,
    this.child,
  }) : super(key: key);

  static EufemiaSpacingData of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<EufemiaSpacingProvider>();
    if (provider == null) return EufemiaSpacingData.fallback();
    return provider.value;
  }

  static _EufemiaSpacingState _findState(BuildContext context) {
    final state = context.findAncestorStateOfType<_EufemiaSpacingState>();
    if (state == null) {
      throw Exception('No EufemiaSpacing found in the widget tree');
    }
    return state;
  }

  static void update(BuildContext context, EufemiaSpacingData data) {
    _findState(context).update(data);
  }

  @override
  _EufemiaSpacingState createState() => _EufemiaSpacingState();
}

class _EufemiaSpacingState extends State<EufemiaSpacing> {
  EufemiaSpacingData _data;

  @override
  void initState() {
    _data = widget.data;
    super.initState();
  }

  void update(EufemiaSpacingData spacing) {
    setState(() => _data = spacing);
  }

  @override
  Widget build(BuildContext context) {
    return EufemiaSpacingProvider(
      value: _data ?? EufemiaSpacingData.fallback(),
      child: widget.child,
    );
  }
}

class EufemiaSpacingProvider extends InheritedWidget {
  final EufemiaSpacingData value;

  EufemiaSpacingProvider({
    Key key,
    Widget child,
    this.value,
  }) : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(EufemiaSpacingProvider oldWidget) {
    return value != oldWidget.value;
  }
}
