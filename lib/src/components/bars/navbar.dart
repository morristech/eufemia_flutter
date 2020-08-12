import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Navbar<T> extends StatelessWidget implements PreferredSizeWidget {
  Navbar({
    Key key,
    this.title,
    this.actions,
    this.leading,
    this.bottom,
    this.centerTitle,
    this.automaticallyImplyLeading = true,
    this.usePlatformNavigation,
    this.result,
  })  : preferredSize = Size.fromHeight(
          bottom?.preferredSize?.height ?? 0.0 + kToolbarHeight,
        ),
        super(key: key);

  final Widget title;
  final List<Widget> actions;
  final Widget leading;
  final bool automaticallyImplyLeading;
  final bool usePlatformNavigation;
  final bool centerTitle;
  final PreferredSizeWidget bottom;
  final T result;

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);
    final parentRoute = ModalRoute.of(context);
    final canPop = usePlatformNavigation || (parentRoute?.canPop ?? false);

    if (usePlatformNavigation == null) {
      usePlatformNavigation != Eufemia.of(context).isStandaloneApp;
    }

    final style = getPlatformDefaultStyle(context).copyWith(
      color: palette.navbarTitle,
    );

    var icon = leading;

    if (icon == null) {
      if (automaticallyImplyLeading && canPop) {
        icon = GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Icon(EufemiaIcons.back_arrow, size: 16.0),
          onTap: () => usePlatformNavigation
              ? SystemNavigator.pop()
              : Navigator.of(context).pop(result),
        );
      }
    }

    return AppBar(
      title: DefaultTextStyle(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 80),
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: child,
          ),
          child: title,
        ),
        style: style,
      ),
      actions: [
        if (actions?.isNotEmpty ?? false) ...{
          EufemiaRow(
            padding: EufemiaInsets.medium(EufemiaSides.right),
            children: actions,
          ),
        },
      ],
      bottom: bottom,
      centerTitle: centerTitle,
      leading: icon,
      titleSpacing:
          icon == null ? EufemiaSpace.medium.toPoints(context: context) : 0.0,
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
