import 'package:eufemia/components.dart';
import 'package:eufemia/palette.dart';
import 'package:eufemia/typography.dart';
import 'package:eufemia/spacing.dart';
import 'package:flutter/material.dart';

// Different message types
enum _MessageType {
  info,
  warning,
  error,
}

/// {@category Components}
/// A message box from the Eufemia design system.
class MessageBox extends StatefulWidget {
  /// The icon to display.
  final Widget icon;

  /// The color of this [MessageBox].
  final Color color;

  /// {@macro eufemia.components.label}
  final String label;

  /// {@macro eufemia.gestures.onTap}
  final VoidCallback onTap;

  // Private message type
  final _MessageType type;

  // TODO (@arnemolland): Make public and allow for custom [MessageBox] widgets.
  const MessageBox._({
    Key key,
    this.icon,
    this.color,
    @required this.label,
    this.type,
    this.onTap,
  }) : super(key: key);

  @override
  _MessageBoxState createState() => _MessageBoxState();

  factory MessageBox.info(String label, {VoidCallback onTap}) {
    return MessageBox._(
      label: label,
      type: _MessageType.info,
      onTap: onTap,
    );
  }

  factory MessageBox.warning(String label, {VoidCallback onTap}) {
    return MessageBox._(
      label: label,
      type: _MessageType.warning,
      onTap: onTap,
    );
  }

  factory MessageBox.error(String label, {VoidCallback onTap}) {
    return MessageBox._(
      label: label,
      type: _MessageType.error,
      onTap: onTap,
    );
  }
}

class _MessageBoxState extends State<MessageBox> {
  bool get hasType => widget.type != null;
  bool get tappable => widget.onTap != null;

  bool isActive = false;
  bool isHover = false;
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);
    final spacing = EufemiaSpacing.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => isActive = true),
        onTapUp: (_) => setState(() => isActive = false),
        onTapCancel: () => setState(() => isActive = false),
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 80),
          padding: EdgeInsets.all(spacing.medium),
          decoration: BoxDecoration(
            color: boxColor(context),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: EufemiaFlex(
            direction: Axis.horizontal,
            children: [
              typeToIcon(widget.type, palette) ?? widget.icon,
              SizedBox(width: spacing.medium),
              Flexible(
                child: Text(
                  widget.label,
                  style: EufemiaTypography.of(context)
                      .styles
                      .footnote
                      .toTextStyle(context),
                  maxLines: 10,
                  overflow: TextOverflow.fade,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color boxColor(BuildContext context) {
    final palette = EufemiaPalette.of(context);
    var color =
        widget.color ?? typeToBoxColor(widget.type, palette) ?? palette.info;
    if (isActive && tappable) {
      color = palette.bright
          ? Color.lerp(color, palette.black, .2)
          : color.withOpacity(.24);
    } else if (isHover && tappable) {
      color = palette.bright
          ? Color.lerp(color, palette.black, .1)
          : color.withOpacity(.32);
    }
    return color;
  }

  Widget typeToIcon(_MessageType type, EufemiaPaletteData palette) {
    switch (type) {
      case _MessageType.info:
        return ColoredIcon(
          icon: Icon(EufemiaIcons.information),
          backgroundColor: palette.info,
          color: palette.onInfo,
          borderRadius: BorderRadius.circular(100),
        );
      case _MessageType.warning:
        return ColoredIcon(
          icon: Icon(EufemiaIcons.alert_hint),
          backgroundColor: palette.warning,
          color: palette.onWarning,
          borderRadius: BorderRadius.circular(100),
        );
      case _MessageType.error:
        return ColoredIcon(
          icon: Icon(EufemiaIcons.alert_hint),
          backgroundColor: palette.error,
          color: palette.onError,
          borderRadius: BorderRadius.circular(100),
        );
      default:
        return null;
    }
  }

  Color typeToBoxColor(_MessageType type, EufemiaPaletteData palette) {
    switch (type) {
      case _MessageType.info:
        return palette.infoBackground;
      case _MessageType.warning:
        return palette.warningBackground;
      case _MessageType.error:
        return palette.errorBackground;
      default:
        return null;
    }
  }

  IconThemeData typeToIconTheme(_MessageType type, EufemiaPaletteData palette) {
    switch (type) {
      case _MessageType.info:
        return IconThemeData(color: palette.onInfo);
      case _MessageType.warning:
        return IconThemeData(color: palette.onWarning);
      case _MessageType.error:
        return IconThemeData(color: palette.onError);
      default:
        return null;
    }
  }
}
