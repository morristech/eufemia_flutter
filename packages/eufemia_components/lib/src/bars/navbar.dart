import 'package:eufemia_components/src/icons/eufemia_icons.dart';
import 'package:eufemia_palette/eufemia_palette.dart';
import 'package:eufemia_typography/eufemia_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  Navbar({
    this.title,
    this.actions,
    this.leading,
    this.bottom,
    this.centerTitle,
    this.automaticallyImplyLeading = true,
    this.systemNavigation = false,
  }) : preferredSize = Size.fromHeight(
          bottom?.preferredSize?.height ?? 0.0 + kToolbarHeight,
        );

  final Widget title;
  final List<Widget> actions;
  final Widget leading;
  final bool automaticallyImplyLeading;
  final bool systemNavigation;
  final bool centerTitle;
  final PreferredSizeWidget bottom;

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);
    final parentRoute = ModalRoute.of(context);
    final canPop = parentRoute?.canPop ?? false;

    final style = getPlatformDefaultStyle(context).copyWith(
      color: palette.navbarTitle,
    );

    return AppBar(
      title: DefaultTextStyle(
        child: title,
        style: style,
      ),
      actions: actions,
      centerTitle: centerTitle,
      leading: leading ?? automaticallyImplyLeading
          ? canPop
              ? GestureDetector(
                  child: Icon(EufemiaIcons.back_arrow, size: 16.0),
                  onTap: () => systemNavigation
                      ? SystemNavigator.pop()
                      : Navigator.of(context).pop(),
                )
              : null
          : null,
    );
  }

  @override
  final Size preferredSize;

  TextStyle getPlatformDefaultStyle(BuildContext context) {
    final typography = EufemiaTypography.of(context);

    switch (Theme.of(context).platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return typography.styles.bodyEmphasized.toTextStyle(context);
      default:
        return typography.styles.titleEmphasized.toTextStyle(context);
    }
  }
}
