import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:medical_app/app/functions.dart';
import 'package:medical_app/presentation/resources/assets_manager.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';
import 'package:medical_app/presentation/widgets/custom_app_bar.dart';

class HelpScreen extends StatelessWidget {
  static const String helpRoute = '/help';

  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.helpCenter),
      backgroundColor: ColorManager.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.contactUs,
              style: getMediumTextStyle(
                color: ColorManager.textColor,
                fontSize: FontSizeManager.s28.sp,
              ),
            ),
            Gap(AppSize.s28.h),
            contactField(ImageAssets.call, Strings.hospitalPhone),
            Gap(AppSize.s14.h),
            contactField(ImageAssets.email, Strings.hospitalEmail),
            Gap(AppSize.s80.h),
            socialButtons(
              ImageAssets.facebook,
              "https://www.facebook.com/momen.mohamed.10888",
              ImageAssets.instagram,
              "https://www.instagram.com/?hl=en",
            ),
            Gap(AppSize.s16.h),
            socialButtons(
              ImageAssets.web,
              "https://www.ge-elevators.com/",
              ImageAssets.tiktok,
              "https://www.tiktok.com/explore",
            ),
          ],
        ),
      ),
    );
  }

  Row socialButtons(String icon1, String link1, String icon2, String link2) {
    return Row(
      children: [
        socialMediaItem(icon1, link1),
        Gap(AppSize.s16.w),
        socialMediaItem(icon2, link2),
      ],
    );
  }

  InkWell contactField(String icon, String title) => InkWell(
    onTap: () => title == Strings.appointments
        ? openUrl("mailto:${Strings.hospitalEmail}")
        : openUrl("tel:${Strings.hospitalPhone}"),
    child: Row(
      children: [
        Container(
          height: AppSize.s50.h,
          width: AppSize.s50.w,
          decoration: BoxDecoration(
            color: Color(0xfff3f4f9),
            borderRadius: BorderRadius.circular(AppPadding.p12.r),
          ),
          child: SvgPicture.asset(
            icon,
            height: AppSize.s20.h,
            width: AppSize.s20.w,
            fit: BoxFit.scaleDown,
          ),
        ),
        Gap(AppSize.s16.w),
        Text(
          title,
          style: getMediumTextStyle(
            color: ColorManager.greyColor,
            fontSize: FontSizeManager.s22.sp,
          ),
        ),
      ],
    ),
  );

  socialMediaItem(String icon, String link) => Expanded(
    child: InkWell(
      onTap: () => openUrl(link),
      child: Container(
        height: AppSize.s60.h,
        decoration: BoxDecoration(
          color: Color(0xffF8F8F9),
          borderRadius: BorderRadius.circular(AppSize.s12.r),
        ),
        child: icon == ImageAssets.web
            ? Image.asset(
                icon,
                height: AppSize.s20.h,
                width: AppSize.s20.w,
                fit: BoxFit.scaleDown,
              )
            : SvgPicture.asset(
                icon,
                height: AppSize.s20.h,
                width: AppSize.s20.w,
                fit: BoxFit.scaleDown,
              ),
      ),
    ),
  );
}
