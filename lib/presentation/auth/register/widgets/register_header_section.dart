import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:medical_app/presentation/resources/assets_manager.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';

class RegisterHeaderSection extends StatelessWidget {
  const RegisterHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SvgPicture.asset(
            ImageAssets.splash,
            colorFilter: ColorFilter.mode(
              ColorManager.primaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        Gap(AppSize.s50.h),
        Text(
          Strings.createYourAccount,
          style: getMediumTextStyle(
            color: ColorManager.textColor,
            fontSize: FontSizeManager.s20.sp,
          ),
        ),
        Gap(AppSize.s25.h),
      ],
    );
  }
}
