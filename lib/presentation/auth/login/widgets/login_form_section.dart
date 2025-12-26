import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';
import 'package:medical_app/presentation/widgets/button_widget.dart';
import 'package:medical_app/presentation/widgets/email_field_widget.dart';
import 'package:medical_app/presentation/widgets/password_field.dart';
import 'package:medical_app/presentation/widgets/text_button_widget.dart';

class LoginFormSection extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onForgetPassword;
  final VoidCallback onLogin;

  const LoginFormSection({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onForgetPassword,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EmailField(emailController: emailController),
        Gap(AppSize.s25.h),
        PasswordField(
          controller: passwordController,
          hintText: Strings.password,
        ),
        Gap(AppSize.s8.h),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: TextButtonWidget(
            text: Strings.forgetPassword,
            fontSize: FontSizeManager.s16.sp,
            color: ColorManager.primaryColor,
            onPressed: onForgetPassword,
          ),
        ),
        Gap(AppSize.s25.h),
        ButtonWidget(
          text: Strings.login,
          color: ColorManager.primaryColor,
          radius: AppSize.s12,
          width: double.infinity,
          height: AppSize.s55.h,
          onTap: onLogin,
        ),
      ],
    );
  }
}
