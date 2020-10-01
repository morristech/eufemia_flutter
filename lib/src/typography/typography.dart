import 'package:flutter/widgets.dart';

import 'typography_data.dart';
import 'text_style.dart';

/// Widget providing its children with [EufemiaTypographyData] as well as
/// methods for loading and updating the typography during runtime.
class EufemiaTypography extends StatefulWidget {
  /// The [EufemiaTypographyData] to be provided.
  final EufemiaTypographyData data;

  /// {@macro flutter.widgets.child}
  final Widget child;

  const EufemiaTypography({
    Key key,
    this.child,
    @required this.data,
  }) : super(key: key);

  /// Retrieves the nearest instance of [EufemiaTypographyData] in the tree.
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

  /// Updates the [data] with the given [data].
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.data != null) {
      setState(() => _data = widget.data);
    }
  }

  @override
  void didUpdateWidget(EufemiaTypography oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.data != null) {
      setState(() => _data = widget.data);
    }
  }

  @override
  Widget build(BuildContext context) {
    final value = _data ?? EufemiaTypographyData.fallback();
    return EufemiaTypographyProvider(
      value: value,
      child: AnimatedDefaultTextStyle(
        duration: Duration(milliseconds: 160),
        style: value.styles.body.toTextStyle(context, typography: value),
        child: widget.child,
      ),
    );
  }
}

/// {@category Typography}
/// A provider wrapper around [EufemiaTypographyData] allowing its children
/// to be notified and rebuilt when the typography changes.
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
