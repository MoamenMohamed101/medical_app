import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? titleColor;
  final VoidCallback? onBack;
  final bool showBack;

  const CustomAppBar({
    super.key,
    this.title,
    this.titleColor,
    this.onBack,
    this.showBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: ColorManager.whiteColor,
      elevation: 0,
      centerTitle: true,
      leading: showBack
          ? IconButton(
              onPressed: onBack ?? () => context.pop(),
              icon: const Icon(
                Icons.arrow_back_outlined,
                color: ColorManager.primaryColor,
                size: AppSize.s30,
              ),
            )
          : null,
      title: title != null
          ? Text(
              title!,
              style: getSemiBoldTextStyle(
                color: titleColor ?? ColorManager.textColor,
                fontSize: FontSizeManager.s18.sp,
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSize.s55.h);
}
