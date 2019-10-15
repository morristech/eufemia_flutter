import 'dart:io';

import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _kSearchBarIOSBorderRadius = 10.0;
const double _kSearchBarAndroidBorderRadius = 4.0;
const double _kCancelButtonPadding = 12.0;
const double _kSearchTextSize = 17.0;
const double _kSearchBarSuffixIconSize = 16.0;
const int _kSearchBarAnimationDuration = 250;
final Color _kSearchBarColor = EufemiaColors.coal.withOpacity(0.08);
final Color _kSearchBarFocusColor = EufemiaColors.coal.withOpacity(0.09);
final Color _kSearchBarPrefixColor = EufemiaColors.seaGreenAlt;
final Color _kSearchBarSuffixColor = EufemiaColors.darkGray;

/// Search bar from the Eufemia Design System
class SearchBar extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  /// Search bar from the Eufemia Design System
  ///
  /// * [controller]: The [TextEditingController] to use
  /// * [onChanged]: Callback for when the given [controller] changes
  const SearchBar({Key key, @required this.controller, this.onChanged}) : super(key: key);
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    widget.controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AnimatedContainer(
            width: double.infinity,
            curve: Curves.ease,
            duration: Duration(milliseconds: _kSearchBarAnimationDuration),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                Platform.isIOS ? _kSearchBarIOSBorderRadius : _kSearchBarAndroidBorderRadius,
              ),
              child: TextField(
                style: TextStyle(
                  fontSize: _kSearchTextSize,
                ),
                onChanged: widget.onChanged,
                controller: widget.controller,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  prefixIcon: _getPrefix(),
                  suffixIcon: AnimatedOpacity(
                    opacity: _showSuffix ? 1.0 : 0.0,
                    duration: Duration(
                      milliseconds: _kSearchBarAnimationDuration,
                    ),
                    child: _getSuffix(),
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontSize: _kSearchTextSize,
                  ),
                  filled: true,
                  fillColor: _focusNode.hasFocus ? _kSearchBarFocusColor : _kSearchBarColor,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        if (Platform.isIOS) ...{
          AnimatedContainer(
            duration: Duration(milliseconds: _kSearchBarAnimationDuration),
            child: _focusNode.hasFocus
                ? Padding(
                    padding: const EdgeInsets.only(left: _kCancelButtonPadding),
                    child: TextButton(
                      size: ButtonSize.large,
                      label: 'Cancel',
                      onPressed: _clearTextField,
                    ),
                  )
                : SizedBox(),
          )
        },
      ],
    );
  }

  bool get _showSuffix => widget.controller.text.length > 0;

  void _clearTextField() {
    // Workaround to avoid the Input field reacting to suffix button presses
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller.clear();
      _focusNode.unfocus();
    });
  }

  Widget _getSuffix() => GestureDetector(
        child: Icon(
          Icons.cancel,
          color: _kSearchBarSuffixColor,
          size: 18.0,
        ),
        onTap: _clearTextField,
      );

  Widget _getPrefix() {
    if (Platform.isIOS) {
      return Icon(
        Icons.search,
        color: _kSearchBarPrefixColor,
      );
    } else {
      return AnimatedSwitcher(
        duration: Duration(milliseconds: _kSearchBarAnimationDuration),
        child: _focusNode.hasFocus
            ? Icon(
                Icons.arrow_back,
                color: _kSearchBarPrefixColor,
              )
            : Icon(
                Icons.search,
                color: _kSearchBarPrefixColor,
              ),
      );
    }
  }
}
