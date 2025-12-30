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
import 'package:medical_app/presentation/widgets/button_widget.dart';
import 'package:medical_app/presentation/widgets/text_form_field_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_app/presentation/verify/verify_screen.dart';


class ForgotPasswordViewBody extends StatelessWidget {
  final TextEditingController forgetEmailController = TextEditingController();

  ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
        child: Column(
          children: [
            Gap(AppSize.s40.h),
            SvgPicture.asset(
              ImageAssets.forgetPassword,
              height: AppSize.s74.h,
              width: AppSize.s74.w,
              fit: BoxFit.cover,
            ),
            Gap(AppSize.s24.h),
            Text(
              Strings.forgetPasswordTitle,
              style: getSemiBoldTextStyle(
                color: ColorManager.darkGrayColor,
                fontSize: FontSizeManager.s24.sp,
              ),
            ),
            Gap(AppSize.s12.h),
            Text(
              Strings.forgetPasswordSubtitle,
              style: getRegularTextStyle(
                color: ColorManager.greyColor,
                fontSize: FontSizeManager.s16.sp,
              ),
              textAlign: TextAlign.center,
            ),
            Gap(AppSize.s40.h),
            TextFromFieldWidget(
              hintText: Strings.email,
              controller: forgetEmailController,
            ),
            Gap(AppSize.s40.h),
            ButtonWidget(
              radius: AppSize.s12.r,
              text: Strings.sendResetCode,
              onTap: () {
                context.push(VerifyScreen.verifyRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
