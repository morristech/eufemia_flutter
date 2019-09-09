import 'package:eufemia/eufemia.dart';
import 'package:eufemia/src/style/borders.dart';
import 'package:eufemia/src/style/constants.dart';
import 'package:eufemia/src/utils/icon_position.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class EufemiaCheckbox extends StatefulWidget {
  final String label;
  final String semanticsLabel;
  final Position labelPosition;
  final ValueChanged<bool> onValueChanged;
  final bool value;
  final Color unselectedBackgroundColor;
  final Color selectedBackgroundColor;
  final Color unselectedForegroundColor;
  final Color selectedForegroundColor;
  final Color errorBackgroundColor;
  final Color errorForegroundColor;
  final Color warningBackgroundColor;
  final Color warningForegroundColor;
  final Border unselectedBorder;
  final Border selectedBorder;
  final Border errorBorder;
  final Border warningBorder;
  final Status status;
  final Widget errorChip;
  final Widget warningChip;

  const EufemiaCheckbox({
    Key key,
    this.label,
    this.status = Status.none,
    this.semanticsLabel,
    this.labelPosition = Position.right,
    this.onValueChanged,
    this.value,
    this.unselectedBackgroundColor = EufemiaColors.white,
    this.selectedBackgroundColor = EufemiaColors.seaGreen,
    this.unselectedBorder,
    this.selectedBorder,
    this.unselectedForegroundColor = EufemiaColors.seaGreen,
    this.selectedForegroundColor = EufemiaColors.white,
    this.errorChip,
    this.errorBackgroundColor = EufemiaColors.cherryRed,
    this.errorForegroundColor = EufemiaColors.white,
    this.warningBackgroundColor = EufemiaColors.signalYellow,
    this.warningForegroundColor = EufemiaColors.white,
    this.errorBorder,
    this.warningChip,
    this.warningBorder,
  }) : super(key: key);

  @override
  _EufemiaCheckboxState createState() => _EufemiaCheckboxState();
}

class _EufemiaCheckboxState extends State<EufemiaCheckbox>
    with TickerProviderStateMixin {
  Color _fillColor;
  Color _unselectedForegroundColor;
  Border _border;

  @override
  void initState() {
    super.initState();
    _setColors();
  }

  void _setColors() {
    _unselectedForegroundColor = widget.unselectedForegroundColor;
    if (widget.status == Status.error) {
      _fillColor = widget.value
          ? widget.errorBackgroundColor
          : widget.unselectedBackgroundColor;
      _border = widget.errorBorder ?? EufemiaBorders.error;
      _unselectedForegroundColor = widget.errorBackgroundColor;
    } else if (widget.status == Status.warning) {
      _fillColor = widget.value
          ? widget.warningBackgroundColor
          : widget.unselectedBackgroundColor;
      _border = widget.warningBorder ?? EufemiaBorders.warning;
      _unselectedForegroundColor = widget.warningBackgroundColor;
    } else if (widget.value) {
      _fillColor = widget.selectedBackgroundColor;
      _border = widget.selectedBorder ?? EufemiaBorders.invisible;
    } else {
      _fillColor = widget.unselectedBackgroundColor;
      _border = widget.unselectedBorder ?? EufemiaBorders.standard;
    }

    if (!enabled && !widget.value) {
      _border = EufemiaBorders.mint;
    }
  }

  /// Getter for changing [enabled] status
  bool get enabled => _isWidgetEnabled(widget);

  /// Returns [true] if the given [EufemiaRawButton] has a non-null [onPressed] callback, else returns [false]
  bool _isWidgetEnabled(EufemiaCheckbox widget) =>
      widget.onValueChanged != null;

  @override
  Widget build(BuildContext context) {
    _setColors();
    return Semantics(
      label: widget.semanticsLabel ?? widget.label,
      checked: widget.value,
      child: AnimatedOpacity(
        duration: EufemiaConstants.animationDuration,
        curve: Curves.ease,
        opacity: enabled ? 1.0 : 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildChildren(),
            ),
            if (widget.errorChip != null && widget.status == Status.error) ...{
              widget.errorChip,
            },
            if (widget.warningChip != null &&
                widget.status == Status.warning) ...{
              widget.warningChip,
            }
          ],
        ),
      ),
    );
  }

  List<Widget> _buildChildren() {
    List<Widget> children = [
      if (widget.label != null) ...{
        Text(widget.label),
      },
      SizedBox(
        width: 8.0,
      ),
      _buildCheckbox(),
    ];

    switch (widget.labelPosition) {
      case Position.left:
        return children;
      case Position.right:
        return children.reversed.toList();
      default:
        return children;
    }
  }

  void _handleOnTap() {
    widget.onValueChanged(!widget.value);
    setState(() {
      _setColors();
    });
  }

  Widget _buildCheckbox() {
    return GestureDetector(
      onTap: enabled ? _handleOnTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        decoration: BoxDecoration(
          color: _fillColor,
          border: _border,
          borderRadius: BorderRadius.circular(EufemiaConstants.checkboxRadius),
        ),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
          opacity: widget.value ? 1.0 : 0.0,
          child: Center(
            child: Icon(
              EufemiaIcons.check_medium,
              color: widget.value
                  ? widget.selectedForegroundColor
                  : _unselectedForegroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
