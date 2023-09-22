import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_text_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double? titleSize;
  final FontWeight? fontWeight;
  final Widget? leading;
  final bool? withLeading;
  final Widget? image;
  final bool centerTitle;
  final Color? color;
  final Color? statusBarColor;
  final Brightness? statusBarIconBrightness;
  final Color? titleColor;
  final List<Widget>? actions;
  final Function()? backClick;
  final double? elevation;

  const CustomAppBar({
    Key? key,
    this.title,
    this.leading,
    this.actions,
    this.centerTitle = true,
    this.color,
    this.titleSize,
    this.fontWeight,
    this.elevation = 4,
    this.titleColor, this.statusBarColor, this.statusBarIconBrightness, this.backClick, this.image, this.withLeading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: color ?? Colors.white,
      elevation: elevation,
      shadowColor:  Colors.black.withOpacity(0.3),
      automaticallyImplyLeading: false,
      leading: withLeading == false ? null : leading ??
          IconButton(
              onPressed: backClick ?? () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios)),
      title: image ?? CustomTextWidget(
        text: title ?? '',
        fontSize: titleSize ?? 18,
        fontWeight: fontWeight ?? FontWeight.w800,
        color: titleColor ?? Colors.black,
      ),
      centerTitle: centerTitle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(54);
}
