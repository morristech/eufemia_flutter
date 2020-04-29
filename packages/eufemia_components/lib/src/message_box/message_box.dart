import 'package:eufemia/eufemia.dart';
import 'package:eufemia_palette/eufemia_palette.dart';
import 'package:eufemia_typography/eufemia_typography.dart';
import 'package:eufemia_spacing/eufemia_spacing.dart';
import 'package:flutter/material.dart';

enum _MessageType {
  info,
  warning,
  error,
}

class MessageBox extends StatelessWidget {
  final Widget icon;
  final Color color;
  final String label;
  final _MessageType type;

  const MessageBox({
    Key key,
    this.icon,
    this.color,
    @required this.label,
    this.type,
  }) : super(key: key);

  bool get hasType => type != null;

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);
    final spacing = EufemiaSpacing.of(context);

    return Container(
      padding: EdgeInsets.all(spacing.medium),
      decoration: BoxDecoration(
        color: color ?? typeToBoxColor(type, palette) ?? palette.info,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: EufemiaFlex(
        direction: Axis.horizontal,
        children: [
          typeToIcon(type, palette) ?? icon,
          SizedBox(width: spacing.medium),
          Flexible(
            child: Text(
              label,
              style: EufemiaTypography.of(context)
                  .styles
                  .footnote
                  .copyWith
                  .call(color: hasType ? palette.black : null)
                  .toTextStyle(context),
              maxLines: 10,
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
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

  factory MessageBox.info(String label) {
    return MessageBox(
      label: label,
      type: _MessageType.info,
    );
  }

  factory MessageBox.warning(String label) {
    return MessageBox(
      label: label,
      type: _MessageType.warning,
    );
  }

  factory MessageBox.error(String label) {
    return MessageBox(
      label: label,
      type: _MessageType.error,
    );
  }
}
