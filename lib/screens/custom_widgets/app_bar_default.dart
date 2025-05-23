import 'package:flutter/material.dart';
import '../../app/config/color_manager.dart';
import '../../app/config/style_manager.dart';

class AppBarDefault extends StatelessWidget implements PreferredSizeWidget {
  final title;
  AppBarDefault({super.key, this.title = ""});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      iconTheme: IconThemeData(color: ColorManager.whiteColor),
      title: Text(title,
          style: StyleManager.h2_Bold(color: ColorManager.whiteColor)),
      backgroundColor: ColorManager.firstColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
