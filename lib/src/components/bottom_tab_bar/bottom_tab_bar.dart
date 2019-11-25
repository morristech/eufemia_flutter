import 'package:eufemia/src/components/bottom_tab_bar/tab_icon.dart';
import 'package:eufemia/src/components/bottom_tab_bar/tab_item.dart';
import 'package:eufemia/src/components/bottom_tab_bar/tab_theme.dart';
import 'package:eufemia/src/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const double _tabHeight = 24.0;

class BottomTabBar extends StatefulWidget implements PreferredSizeWidget {
  final List<TabItem> items;
  final TabController controller;
  final TabTheme theme;
  final Color color;
  final bool bottomSafeArea;

  const BottomTabBar({
    Key key,
    @required this.items,
    this.controller,
    this.theme,
    this.color,
    this.bottomSafeArea = true,
  }) : super(key: key);

  @override
  _BottomTabBarState createState() => _BottomTabBarState();

  @override
  Size get preferredSize => Size.fromHeight(_tabHeight);
}

class _BottomTabBarState extends State<BottomTabBar> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (widget.controller.indexIsChanging) {
        // Update the active widget
        setState(() {});
      }
    });
  }

  void _navigateTo(int index) {
    widget.controller.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.color ?? Theme.of(context).bottomAppBarColor ?? Colors.white,
        border: Border(
          top: BorderSide(
            width: 1,
            color: Theme.of(context).brightness == Brightness.light
                ? EufemiaColors.lightShadow
                : Colors.white.withOpacity(0.1),
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        bottom: widget.bottomSafeArea,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: widget.items
              .map(
                (item) => Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onLongPress: item.onLongPressed ?? null,
                    onTap: () => _navigateTo(widget.items.indexOf(item)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                      child: _TabItem(
                        active: widget.controller.index == widget.items.indexOf(item),
                        label: item.label,
                        icon: item.icon,
                        theme: widget.theme ??
                            (Theme.of(context).brightness == Brightness.light
                                ? TabTheme.light
                                : TabTheme.dark),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _TabItem extends StatefulWidget {
  final TabIcon icon;
  final TabTheme theme;
  final bool active;
  final String label;

  const _TabItem({
    Key key,
    @required this.icon,
    this.theme,
    @required this.active,
    this.label,
  }) : super(key: key);

  @override
  _TabItemState createState() => _TabItemState();
}

class _TabItemState extends State<_TabItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        LimitedBox(
          maxHeight: 24,
          maxWidth: 24,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 250),
            child: widget.active ? _getActiveIcon() : _getInactiveIcon(),
          ),
        ),
        if (widget.label != null) ...{
          Padding(
            padding: const EdgeInsets.only(top: 5.54),
            child: Text(
              widget.label,
              style: TextStyle(
                fontSize: Theme.of(context).platform == TargetPlatform.iOS ? 10.0 : 12.0,
                height: 1.33,
                color: _getLabelColor(widget.theme, widget.active),
                fontWeight: widget.active ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ),
        }
      ],
    );
  }

  Color _getLabelColor(TabTheme theme, bool active) {
    switch (theme) {
      case TabTheme.light:
        return active ? EufemiaColors.emeraldGreen : EufemiaColors.seaGreenAlt;
      case TabTheme.dark:
        return active ? EufemiaColors.mintGreen : EufemiaColors.softGray;
      case TabTheme.privateBanking:
        return active ? EufemiaColors.softGray : EufemiaColors.darkGray;
      case TabTheme.saga:
        return active ? EufemiaColors.sagaGold : EufemiaColors.darkGray;
      default:
        return active ? EufemiaColors.emeraldGreen : EufemiaColors.seaGreenAlt;
    }
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
