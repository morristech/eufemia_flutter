import 'package:flutter/widgets.dart';

import 'typography_data.dart';
import 'text_style.dart';

class EufemiaTypography extends StatefulWidget {
  final EufemiaTypographyData data;
  final Widget child;

  const EufemiaTypography({
    Key key,
    this.child,
    @required this.data,
  }) : super(key: key);

  static EufemiaTypographyData of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<EufemiaTypographyProvider>();
    if (provider == null) return EufemiaTypographyData.fallback();
    return provider.value;
  }

  static _EufemiaTypographyState _findState(BuildContext context) {
    final state = context.findAncestorStateOfType<_EufemiaTypographyState>();
    if (state == null) {
      throw Exception('No EufemiaTypography found in the widget tree');
    }
    return state;
  }

  static void update(BuildContext context, EufemiaTypographyData data) {
    _findState(context).update(data);
  }

  @override
  _EufemiaTypographyState createState() => _EufemiaTypographyState();
}

class _EufemiaTypographyState extends State<EufemiaTypography> {
  EufemiaTypographyData _data;

  @override
  void initState() {
    _data = widget.data;
    super.initState();
  }

  void update(EufemiaTypographyData typography) {
    setState(() => _data = typography);
  }

  @override
  Widget build(BuildContext context) {
    final value = _data ?? EufemiaTypographyData.fallback();
    return EufemiaTypographyProvider(
      value: value,
      child: DefaultTextStyle(
        style: value.styles.body.toTextStyle(context, typography: value),
        child: widget.child,
      ),
    );
  }
}

class EufemiaTypographyProvider extends InheritedWidget {
  final EufemiaTypographyData value;

  EufemiaTypographyProvider({
    Key key,
    Widget child,
    this.value,
  }) : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(EufemiaTypographyProvider oldWidget) {
    return value != oldWidget.value;
  }
}
