import 'dart:io';

import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _kBorderWidth = 0.5;
const double _kContentPadding = 16.0;
final Color _kBorderColor = EufemiaColors.outlineGray;
final Color _kIconColor = EufemiaColors.softGray;
final Color _kLeadingIconColor = EufemiaColors.seaGreenAlt;
final Duration _kStyleChangeDuration = Duration(milliseconds: 500);

class Cell extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget trailing;
  final Widget subtitle;
  final VoidCallback onTap;
  final bool implyNavigation;

  const Cell({
    Key key,
    this.leading,
    this.title,
    this.trailing,
    this.subtitle,
    this.onTap,
    this.implyNavigation = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _subtitleTextStyle = Theme.of(context).textTheme.subtitle;
    final _titleTextStyle = Theme.of(context).textTheme.subhead;
    final _trailingTextStyle = Theme.of(context).textTheme.subhead.copyWith(
          fontWeight: FontWeight.bold,
        );
    final _leadingTextStyle = _trailingTextStyle.copyWith(
      fontSize: 20.0,
    );

    return SafeArea(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: Platform.isIOS ? const EdgeInsets.only(left: _kContentPadding) : EdgeInsets.zero,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: _kBorderWidth,
                  color: _kBorderColor,
                ),
              ),
            ),
            child: Padding(
              padding: Platform.isIOS
                  ? EdgeInsets.only(
                      top: _kContentPadding,
                      right: _kContentPadding,
                      bottom: _kContentPadding,
                    )
                  : const EdgeInsets.all(_kContentPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (leading != null) ...{
                        AnimatedDefaultTextStyle(
                          duration: _kStyleChangeDuration,
                          style: _leadingTextStyle,
                          child: IconTheme(
                            data: IconThemeData(
                              color: _kLeadingIconColor,
                            ),
                            child: leading,
                          ),
                        ),
                      },
                      if (title != null) ...{
                        Padding(
                          padding: EdgeInsets.only(
                            left: leading != null ? _kContentPadding : 0.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AnimatedDefaultTextStyle(
                                style: _titleTextStyle,
                                duration: _kStyleChangeDuration,
                                child: title,
                              ),
                              if (subtitle != null) ...{
                                AnimatedDefaultTextStyle(
                                  style: _subtitleTextStyle,
                                  duration: _kStyleChangeDuration,
                                  child: subtitle,
                                ),
                              },
                            ],
                          ),
                        )
                      },
                    ],
                  ),
                  if (trailing != null) ...{
                    AnimatedDefaultTextStyle(
                      duration: _kStyleChangeDuration,
                      style: _trailingTextStyle,
                      child: IconTheme(
                        data: IconThemeData(color: _kIconColor),
                        child: trailing,
                      ),
                    ),
                  } else if (implyNavigation) ...{
                    AnimatedDefaultTextStyle(
                      duration: _kStyleChangeDuration,
                      style: _trailingTextStyle,
                      child: IconTheme(
                        data: IconThemeData(color: _kIconColor),
                        child: Icon(Icons.chevron_right),
                      ),
                    ),
                  },
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
