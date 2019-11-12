import 'package:eufemia/src/components/bottom_tab_bar/tab_icon.dart';
import 'package:eufemia/src/components/bottom_tab_bar/tab_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TabItem extends StatefulWidget {
  final TabIcon icon;
  final TabTheme theme;
  final bool active;

  const TabItem({
    Key key,
    @required this.icon,
    this.theme,
    @required this.active,
  }) : super(key: key);

  @override
  _TabItemState createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 250),
      child: widget.active ? _getActiveIcon() : _getInactiveIcon(),
    );
  }

  Widget _getActiveIcon() {
    return SvgPicture.asset(
      '${_getAssetPath(widget.theme, widget.icon)}_active.svg',
      package: 'eufemia',
    );
  }

  Widget _getInactiveIcon() {
    return SvgPicture.asset(
      '${_getAssetPath(widget.theme, widget.icon)}_inactive.svg',
      package: 'eufemia',
    );
  }

  String _getAssetPath(TabTheme theme, TabIcon icon) {
    String path = 'lib/assets/icons/tabbar';
    switch (theme) {
      case TabTheme.dark:
        path = '$path/dm';
        break;
      case TabTheme.light:
        path = '$path/lm';
        break;
      case TabTheme.privateBanking:
        path = '$path/pb';
        break;
      case TabTheme.saga:
        path = '$path/saga';
        break;
    }
    switch (icon) {
      case TabIcon.coins:
        path = '${path}_coins';
        break;
      case TabIcon.house:
        path = '${path}_house';
        break;
      case TabIcon.keyFigures:
        path = '${path}_kf';
        break;

      case TabIcon.person:
        path = '${path}_person';
        break;
      case TabIcon.wallet:
        path = '${path}_wallet';
        break;
      default:
    }

    return path;
  }
}
