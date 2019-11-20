import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

const double _searchBarIOSBorderRadius = 10.0;
const double _searchBarAndroidBorderRadius = 4.0;
const double _cancelButtonPadding = 12.0;
const double _searchTextSize = 17.0;
const int _searchBarAnimationDuration = 250;
final Color _searchBarColor = EufemiaColors.coal.withOpacity(0.08);
final Color _searchBarFocusColor = EufemiaColors.coal.withOpacity(0.09);
final Color _searchBarPrefixColor = EufemiaColors.seaGreenAlt;
final Color _searchBarSuffixColor = EufemiaColors.darkGray;

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
            duration: Duration(milliseconds: _searchBarAnimationDuration),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                Theme.of(context).platform == TargetPlatform.iOS
                    ? _searchBarIOSBorderRadius
                    : _searchBarAndroidBorderRadius,
              ),
              child: TextField(
                style: TextStyle(
                  fontSize: _searchTextSize,
                ),
                onChanged: widget.onChanged,
                controller: widget.controller,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  prefixIcon: _getPrefix(),
                  suffixIcon: AnimatedOpacity(
                    opacity: _showSuffix ? 1.0 : 0.0,
                    duration: Duration(
                      milliseconds: _searchBarAnimationDuration,
                    ),
                    child: _getSuffix(),
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontSize: _searchTextSize,
                  ),
                  filled: true,
                  fillColor: _focusNode.hasFocus ? _searchBarFocusColor : _searchBarColor,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        if (Theme.of(context).platform == TargetPlatform.iOS) ...{
          AnimatedContainer(
            duration: Duration(milliseconds: _searchBarAnimationDuration),
            child: _focusNode.hasFocus
                ? Padding(
                    padding: const EdgeInsets.only(left: _cancelButtonPadding),
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
          color: _searchBarSuffixColor,
          size: 18.0,
        ),
        onTap: _clearTextField,
      );

  Widget _getPrefix() {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return Icon(
        Icons.search,
        color: _searchBarPrefixColor,
      );
    } else {
      return AnimatedSwitcher(
        duration: Duration(milliseconds: _searchBarAnimationDuration),
        child: _focusNode.hasFocus
            ? Icon(
                Icons.arrow_back,
                color: _searchBarPrefixColor,
              )
            : Icon(
                Icons.search,
                color: _searchBarPrefixColor,
              ),
      );
    }
  }
}
