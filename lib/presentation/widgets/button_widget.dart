import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  final double radius, width, height;
  final String text;
  final void Function()? onTap;
  final Color color;
  final Color textColor;
  final bool isSmallButton;

  const ButtonWidget({
    super.key,
    required this.radius,
    this.width = double.infinity,
    this.height = AppSize.s55,
    this.color = ColorManager.primaryColor,
    required this.text,
    this.onTap,
    this.textColor = ColorManager.whiteColor,
    this.isSmallButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(radius.r),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        height: height,
        width: width.w,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius.r),
          // border: Border.all(
          //   color: ColorManager.formFieldsBorderColor,
          //   width: AppSize.s1.w,
          // ),
        ),
        child: Center(
          child: Text(
            text,
            style: isSmallButton
                ? getRegularTextStyle(
                    color: textColor,
                    fontSize: AppSize.s12.sp,
                  )
                : getMediumTextStyle(
                    color: textColor,
                    fontSize: AppSize.s18.sp,
                  ),
          ),
        ),
      ),
    );
  }
}
