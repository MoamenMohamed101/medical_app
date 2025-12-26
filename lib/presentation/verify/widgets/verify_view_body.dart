import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_app/presentation/reset_password/reset_password_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:medical_app/presentation/resources/assets_manager.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';
import 'package:medical_app/presentation/verify/widgets/verify_input_field.dart';
import 'package:medical_app/presentation/widgets/button_widget.dart';

class VerifyViewBody extends StatelessWidget {
  const VerifyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
        child: Column(
          children: [
            Gap(AppSize.s40.h),
            SvgPicture.asset(
              ImageAssets.verify,
              height: AppSize.s100.h,
              width: AppSize.s100.w,
            ),
            Gap(AppSize.s24.h),
            Text(
              Strings.verificationTitle,
              style: getSemiBoldTextStyle(
                color: ColorManager.textColor,
                fontSize: FontSizeManager.s24.sp,
              ),
            ),
            Gap(AppSize.s12.h),
            Text(
              Strings.verificationSubtitle,
              style: getRegularTextStyle(
                color: ColorManager.lightGrayColor,
                fontSize: FontSizeManager.s14.sp,
              ),
              textAlign: TextAlign.center,
            ),
            Gap(AppSize.s40.h),
            VerifyInputField((code) {
              // Handle OTP submission
            }),
            Gap(AppSize.s40.h),
            ButtonWidget(
              radius: AppSize.s12.r,
              text: Strings.continueButton,
              onTap: () {
                context.push(ResetPasswordScreen.resetPasswordRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
