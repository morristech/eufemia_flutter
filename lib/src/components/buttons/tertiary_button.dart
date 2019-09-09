import 'package:eufemia/eufemia.dart';
import 'package:eufemia/src/utils/icon_position.dart';
import 'package:eufemia/src/utils/icon_size.dart';
import 'package:flutter/material.dart';

class EufemiaTertiaryButton extends StatefulWidget {
  final String text;
  final String semanticsLabel;
  final IconData icon;
  final Position iconPosition;
  final IconSize iconSize;
  final VoidCallback onPressed;

  const EufemiaTertiaryButton({
    Key key,
    this.text,
    this.semanticsLabel,
    this.icon,
    this.iconSize = IconSize.small,
    this.iconPosition = Position.right,
    this.onPressed,
  }) : super(key: key);

  @override
  _EufemiaTertiaryButtonState createState() => _EufemiaTertiaryButtonState();
}

class _EufemiaTertiaryButtonState extends State<EufemiaTertiaryButton> {
  bool showBorder;

  /// Getter for changing []
  bool get enabled => _isWidgetEnabled(widget);

  /// Returns [true] if the given [EufemiaButton] has a non-null [onPressed] callback, else returns [false]
  bool _isWidgetEnabled(EufemiaTertiaryButton widget) =>
      widget.onPressed != null;

  @override
  void initState() {
    super.initState();
    showBorder = false;
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticsLabel,
      child: GestureDetector(
        onTapDown: handleTapDown,
        onTapUp: handleTapUp,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: buildButton(),
        ),
      ),
    );
  }

  Widget buildButton() {
    if (widget.iconSize != IconSize.small) {
      return buildSeparatedButton();
    } else {
      return buildInlineButton();
    }
  }

  Widget buildInlineButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedContainer(
          curve: Curves.ease,
          duration: Duration(milliseconds: 250),
          decoration: BoxDecoration(border: getBorder()),
          child: Opacity(
            opacity: enabled ? 1.0 : 0.7,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: buildOrderedContent(),
            ),
          ),
        ),
        SizedBox(
          height: getIconSize(widget.iconSize),
        ),
      ],
    );
  }

  Widget buildSeparatedButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.iconPosition == Position.left) ...{buildIcon()},
        AnimatedContainer(
          curve: Curves.ease,
          duration: Duration(milliseconds: 250),
          decoration: BoxDecoration(border: getBorder()),
          child: Opacity(
            opacity: enabled ? 1.0 : 0.7,
            child: Text(widget.text),
          ),
        ),
        if (widget.iconPosition == Position.right) ...{buildIcon()},
      ],
    );
  }

  List<Widget> buildOrderedContent() {
    List<Widget> children = [Text(widget.text), buildIcon()];

    if (widget.iconPosition == Position.left) {
      return children.reversed.toList();
    } else {
      return children;
    }
  }

  BoxBorder getBorder() {
    if (showBorder)
      return Border(
        bottom: BorderSide(
          color: EufemiaColors.emeraldGreen,
          width: 2,
        ),
      );
    else
      return null;
  }

  void handleTapDown(TapDownDetails details) {
    setState(() => showBorder = true);
    widget.onPressed();
  }

  void handleTapUp(TapUpDetails details) {
    setState(() => showBorder = false);
  }

  Widget buildIcon() {
    return Opacity(
      opacity: enabled ? 1.0 : 0.7,
      child: Icon(
        widget.icon,
        color: EufemiaColors.seaGreen,
        size: getIconSize(widget.iconSize),
      ),
    );
  }
}
