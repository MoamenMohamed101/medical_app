import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';
import 'package:medical_app/presentation/widgets/button_widget.dart';
import 'package:medical_app/presentation/widgets/email_field_widget.dart';
import 'package:medical_app/presentation/widgets/password_field.dart';
import 'package:medical_app/presentation/widgets/text_button_widget.dart';

class RegisterFormSection extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final VoidCallback onSignUp;

  const RegisterFormSection({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.onSignUp,
  });

  @override
  State<RegisterFormSection> createState() => _RegisterFormSectionState();
}

class _RegisterFormSectionState extends State<RegisterFormSection> {
  bool _isAgreed = false;

  void _onAgreementChanged(bool? value) {
    setState(() {
      _isAgreed = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EmailField(emailController: widget.emailController),
        Gap(AppSize.s25.h),
        PasswordField(
          controller: widget.passwordController,
          hintText: Strings.password,
        ),
        Gap(AppSize.s25.h),
        PasswordField(
          controller: widget.confirmPasswordController,
          hintText: Strings.confirmPassword,
        ),
        Gap(AppSize.s10.h),
        _buildTermsAndConditions(),
        Gap(AppSize.s25.h),
        ButtonWidget(
          text: Strings.signUp,
          color: ColorManager.primaryColor,
          radius: AppSize.s12,
          width: double.infinity,
          height: AppSize.s55.h,
          onTap: widget.onSignUp,
        ),
      ],
    );
  }

  Widget _buildTermsAndConditions() {
    return Row(
      children: [
        SizedBox(
          height: 24.h,
          width: 24.w,
          child: Checkbox(
            value: _isAgreed,
            onChanged: _onAgreementChanged,
            activeColor: ColorManager.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        Gap(AppSize.s10.w),
        Text(
          Strings.agreeWith,
          style: getRegularTextStyle(
            color: ColorManager.textColor,
            fontSize: FontSizeManager.s14.sp,
          ),
        ),
        TextButtonWidget(
          text: Strings.termsConditions,
          fontSize: FontSizeManager.s14.sp,
          color: ColorManager.primaryColor,
          onPressed: () {
            // TODO: Navigate to Terms & Conditions
          },
        ),
      ],
    );
  }
}
