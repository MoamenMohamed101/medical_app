import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
      child: Container(
        height: AppSize.s50.h,
        decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(AppSize.s12.r),
          border: Border.all(color: ColorManager.lightGrey),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
          child: Row(
            children: [
              const Icon(Icons.search, color: ColorManager.greyColor),
              Gap(AppSize.s12.w),
              Expanded(
                child: Text(
                  Strings.searchHint,
                  style: getRegularTextStyle(
                    color: ColorManager.greyColor,
                    fontSize: FontSizeManager.s14.sp,
                  ),
                ),
              ),
              const Icon(Icons.mic, color: ColorManager.greyColor),
            ],
          ),
        ),
      ),
    );
  }
}
