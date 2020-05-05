import 'package:eufemia/eufemia.dart';
import 'package:eufemia_components/src/utils/calculate_size.dart';
import 'package:flutter/material.dart';

/// Search bar from the Eufemia Design System
class SearchField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final FocusNode focusNode;
  final String hintText;
  final String cancelText;
  final Color color;
  final Color accentColor;
  final Color textColor;
  final Color hintColor;
  final Color buttonColor;

  /// Search bar from the Eufemia Design System
  ///
  /// * [controller]: The [TextEditingController] to use
  /// * [onChanged]: Callback for when the given [controller] changes
  const SearchField({
    Key key,
    this.controller,
    this.onChanged,
    this.focusNode,
    this.color,
    this.textColor,
    this.hintText,
    this.accentColor,
    this.cancelText = 'Cancel',
    this.hintColor,
    this.buttonColor,
  }) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();

  factory SearchField.onMint({
    TextEditingController controller,
    Function(String) onChanged,
    FocusNode focusNode,
    String hintText,
    String cancelText,
  }) =>
      SearchField(
        controller: controller,
        onChanged: onChanged,
        focusNode: focusNode,
        hintText: hintText,
        cancelText: cancelText,
        color: EufemiaColors.searchStandard,
        accentColor: EufemiaColors.seaGreen,
        textColor: EufemiaColors.coal,
        hintColor: EufemiaColors.darkGray,
      );

  factory SearchField.onWhite({
    TextEditingController controller,
    Function(String) onChanged,
    FocusNode focusNode,
    String hintText,
    String cancelText,
  }) =>
      SearchField(
        controller: controller,
        onChanged: onChanged,
        focusNode: focusNode,
        hintText: hintText,
        cancelText: cancelText,
        color: EufemiaColors.searchForms,
        accentColor: EufemiaColors.seaGreen,
        textColor: EufemiaColors.coal,
        hintColor: EufemiaColors.darkGray,
      );

  factory SearchField.onSeaGreen({
    TextEditingController controller,
    Function(String) onChanged,
    FocusNode focusNode,
    String hintText,
    String cancelText,
  }) =>
      SearchField(
        controller: controller,
        onChanged: onChanged,
        focusNode: focusNode,
        hintText: hintText,
        cancelText: cancelText,
        color: EufemiaColors.searchPayments,
        accentColor: EufemiaColors.seaGreen,
        textColor: EufemiaColors.coal,
        hintColor: EufemiaColors.darkGray,
        buttonColor: EufemiaColors.mintGreen,
      );
}

class _SearchFieldState extends State<SearchField> {
  FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = widget.focusNode ?? FocusNode();
    widget.controller.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = EufemiaPalette.of(context);
    final typography = EufemiaTypography.of(context);
    final spacing = EufemiaSpacing.of(context);

    final style = typography.styles.body
        .copyWith(color: widget.textColor ?? palette.onSearch)
        .toTextStyle(context);

    final hintStyle = style.copyWith(
      color: widget.hintColor ?? palette.onSearchInactive,
    );

    final size = calculateSize(
      widget.cancelText,
      typography.styles.button.toTextStyle(context),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        return TweenAnimationBuilder(
          duration: Duration(milliseconds: 160),
          curve: Curves.ease,
          tween: Tween<double>(
            begin: 0.0,
            end: showCancelButton ? size.width + spacing.small : 0.0,
          ),
          builder: (context, double animation, _) {
            return EufemiaRow(
              spaceBetween: EufemiaSpace.small,
              children: [
                Expanded(
                  flex: constraints.maxWidth.toInt(),
                  child: TextField(
                    cursorColor: widget.accentColor ?? palette.secondary,
                    onChanged: widget.onChanged,
                    controller: widget.controller,
                    focusNode: focusNode,
                    style: style,
                    decoration: InputDecoration(
                      filled: true,
                      border: border,
                      hintStyle: hintStyle,
                      enabledBorder: border,
                      focusedBorder: border,
                      hintText: widget.hintText,
                      fillColor: widget.color ?? palette.search,
                      prefixIcon: AnimatedSwitcher(
                        duration: Duration(milliseconds: 80),
                        transitionBuilder: (child, animation) => FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                        child: icon,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: widget.controller.clear,
                        child: Icon(
                          hasText ? EufemiaIcons.clear : null,
                          color: palette.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: animation.toInt(),
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 80),
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                    child: cancelButton,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget get cancelButton {
    if (showCancelButton) {
      final typography = EufemiaTypography.of(context);
      final palette = EufemiaPalette.of(context);

      return GestureDetector(
        child: Text(
          widget.cancelText,
          style: typography.styles.button
              .copyWith(
                color: widget.buttonColor ??
                    widget.accentColor ??
                    palette.secondary,
              )
              .toTextStyle(context),
          overflow: TextOverflow.fade,
          maxLines: 1,
        ),
        onTap: () {
          focusNode.unfocus();
          widget.controller.clear();
        },
      );
    }
    return Container();
  }

  bool get showCancelButton => context.cupertino && focusNode.hasFocus;
  bool get hasText => widget.controller.text.isNotEmpty;

  InputBorder get border {
    return OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(width: 0, color: Color(0x00)),
    );
  }

  Widget get icon {
    final palette = EufemiaPalette.of(context);
    var icon;
    if (context.cupertino) {
      if (focusNode.hasFocus) {
        icon = Icon(EufemiaIcons.loupe,
            color: widget.accentColor ?? palette.secondary);
      } else {
        icon = Icon(EufemiaIcons.loupe, color: palette.grey);
      }
    } else {
      if (focusNode.hasFocus) {
        icon = Icon(EufemiaIcons.back_arrow,
            color: widget.accentColor ?? palette.secondary);
      } else {
        icon = Icon(EufemiaIcons.loupe,
            color: widget.accentColor ?? palette.secondary);
      }
    }

    return icon;
  }

  BorderRadius get radius =>
      BorderRadius.circular(context.cupertino ? 10.0 : 4.0);
}
