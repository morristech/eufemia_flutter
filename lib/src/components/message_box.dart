import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  final Widget icon;
  final Color backgroundColor;
  final String label;

  const MessageBox({
    Key key,
    this.icon,
    this.backgroundColor,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: backgroundColor ?? EufemiaColors.skyBlue,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          icon,
          SizedBox(width: 16.0),
          Flexible(
            child: Text(
              label ?? '',
              style: Eufemia.footnote,
              maxLines: 10,
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }

  factory MessageBox.info(String label) {
    return MessageBox(
      backgroundColor: EufemiaColors.pistachio,
      icon: ColoredIcon(
        icon: EufemiaIcons.information,
        backgroundColor: EufemiaColors.seaGreen,
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      label: label,
    );
  }

  factory MessageBox.warning(String label) {
    return MessageBox(
      backgroundColor: EufemiaColors.sandYellow,
      icon: ColoredIcon(
        icon: EufemiaIcons.alert_hint,
        backgroundColor: EufemiaColors.accentYellow,
        color: EufemiaColors.oceanGreen,
        borderRadius: BorderRadius.circular(100),
      ),
      label: label,
    );
  }

  factory MessageBox.error(String label) {
    return MessageBox(
      backgroundColor: EufemiaColors.emberRed,
      icon: ColoredIcon(
        icon: EufemiaIcons.alert_hint,
        backgroundColor: EufemiaColors.fireRed,
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      label: label,
    );
  }
}
