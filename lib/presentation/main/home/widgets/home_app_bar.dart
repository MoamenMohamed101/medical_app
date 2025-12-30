import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_app/presentation/main/home/screens/notifications_screen.dart';
import 'package:medical_app/presentation/resources/assets_manager.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   width: AppSize.s50.w,
            //   height: AppSize.s50.h,
            //   decoration: const BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: ColorManager.lightGrey,
            //   ),
            // ),
            // SizedBox(width: AppSize.s12.w),
            Text(
              '${Strings.hi}, Marlin',
              style: getMediumTextStyle(
                color: ColorManager.textColor,
                fontSize: FontSizeManager.s16.sp,
              ),
            ),
            Gap(AppSize.s4.h),
            Text(
              Strings.welcomeBack,
              style: getRegularTextStyle(
                color: ColorManager.greyColor,
                fontSize: FontSizeManager.s12.sp,
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () => context.push(NotificationsScreen.notificationRoute),
          child: CircleAvatar(
            radius: AppSize.s20.r,
            backgroundColor: ColorManager.babyBlue.withValues(alpha: 0.03),
            child: SvgPicture.asset(ImageAssets.notification),
          ),
        ),
      ],
    );
  }
}
