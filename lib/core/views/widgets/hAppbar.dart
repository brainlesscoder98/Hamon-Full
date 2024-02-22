import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/ui_colors.dart';
import '../resource/style_manager.dart';

class HAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HAppBar({
    this.actions,
    this.automaticallyImplyLeading = true,
    this.backgroundColor = UIColors.appBarPrimary,
    this.centerTitle,
    this.leading,
    this.title,
    this.subtitle,
    this.subtitleText = '',
    this.titleText = '',
    this.statusBarBrightness = Brightness.dark,
    this.foregroundColor = UIColors.black,
    this.titleTextStyle,
    this.bottom,
    this.leadingWidth = 30, //default 56
    this.titleSpacing,
    super.key,
  });

  const factory HAppBar.secondary({
    List<Widget>? actions,
    bool? automaticallyImplyLeading,
    Color? backgroundColor,
    bool? centerTitle,
    Color? foregroundColor,
    Widget? leading,
    Brightness? statusBarBrightness,
    Widget? title,
    String titleText,
    TextStyle? titleTextStyle,
    PreferredSizeWidget? bottom,
    Key? key,
  }) = _HAppBarSecondary;

  final List<Widget>? actions;
  final bool? automaticallyImplyLeading;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;
  final bool? centerTitle;
  final Color? foregroundColor;
  final Widget? leading;
  final double? leadingWidth;
  final Brightness? statusBarBrightness;
  final Widget? title;
  final Widget? subtitle;
  final double? titleSpacing;
  final String titleText;
  final String subtitleText;
  final TextStyle? titleTextStyle;

  @override
  Size get preferredSize => const Size(0, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title ?? Text(titleText, style: getBoldStyle(fontSize: 25),),
          subtitle ?? Text(subtitleText, style: getSemiBoldStyle(fontSize: 15),),
        ],
      ),
      actions: actions,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading??false,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
        statusBarBrightness: statusBarBrightness,
        statusBarIconBrightness: statusBarBrightness,
      ),
      centerTitle: centerTitle,
      titleTextStyle: titleTextStyle,
      leadingWidth: leadingWidth,
      titleSpacing: titleSpacing,
      bottom: bottom,
    );
  }
}

class _HAppBarSecondary extends HAppBar {
  const _HAppBarSecondary({
    super.actions,
    super.automaticallyImplyLeading = false,
    super.backgroundColor = UIColors.white,
    super.centerTitle,
    super.foregroundColor = UIColors.white,
    super.leading,
    super.statusBarBrightness = Brightness.light,
    super.title,
    super.titleText,
    super.titleTextStyle = const TextStyle(
      color: UIColors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    super.bottom,
    super.key,
  });
}
