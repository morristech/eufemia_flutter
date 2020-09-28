import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'style.dart';

class EufemiaButton extends StatefulWidget {
  // The visual style of the button.
  final EufemiaButtonStyle style;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  /// Called when the user taps this button.
  final GestureTapCallback onTap;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode focusNode;

  /// {@macro flutter.widgets.Focus}
  final String semanticsLabel;

  const EufemiaButton({
    Key key,
    this.style,
    this.child,
    this.onTap,
    this.autofocus = false,
    this.focusNode,
    this.semanticsLabel,
  })  : assert(autofocus != null),
        super(key: key);

  @override
  _EufemiaButtonState createState() => _EufemiaButtonState();
}

class _EufemiaButtonState extends State<EufemiaButton> {
  bool isActive = false;
  bool isHover = false;
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    final style = widget.style ?? EufemiaButtonStyle.primary(context: context);

    var isDisabled = widget.onTap == null;
    var padding = style.padding?.value(
      isActive: isActive,
      isDisabled: isDisabled,
      isHover: isHover,
      isFocused: isFocused,
    );

    // If direct child is an icon, we use same padding everywhere to
    // make the button a square.
    if (widget.child is Icon) {
      padding = EdgeInsets.all(padding.top);
    }

    return Semantics(
      container: true,
      button: true,
      enabled: !isDisabled,
      label: widget.semanticsLabel,
      child: Focus(
        focusNode: widget.focusNode,
        canRequestFocus: !isDisabled,
        onFocusChange: (v) => setState(() => isFocused = true),
        autofocus: widget.autofocus,
        child: MouseRegion(
          onEnter: (_) => setState(() => isHover = true),
          onExit: (_) => setState(() => isHover = false),
          child: GestureDetector(
            onTapDown: (_) => setState(() => isActive = true),
            onTapUp: (_) => setState(() => isActive = false),
            onTapCancel: () => setState(() => isActive = false),
            onTap: widget.onTap,
            behavior: HitTestBehavior.opaque,
            child: AnimatedOpacity(
              duration: style.duration,
              opacity: style.opacity?.value(
                    isActive: isActive,
                    isDisabled: isDisabled,
                    isHover: isHover,
                    isFocused: isFocused,
                  ) ??
                  1.0,
              child: AnimatedContainer(
                duration: style.duration,
                decoration: style.decoration?.value(
                  isActive: isActive,
                  isDisabled: isDisabled,
                  isHover: isHover,
                  isFocused: isFocused,
                ),
                padding: padding,
                child: AnimatedDefaultTextStyle(
                  child: IconTheme(
                    data: style.iconTheme?.value(
                      isActive: isActive,
                      isDisabled: isDisabled,
                      isHover: isHover,
                      isFocused: isFocused,
                    ),
                    child: widget.child,
                  ),
                  style: style.textStyle?.value(
                    isActive: isActive,
                    isDisabled: isDisabled,
                    isHover: isHover,
                    isFocused: isFocused,
                  ),
                  duration: style.duration,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
