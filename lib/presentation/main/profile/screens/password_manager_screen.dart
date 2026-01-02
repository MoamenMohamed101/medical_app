import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';
import 'package:medical_app/presentation/widgets/button_widget.dart';
import 'package:medical_app/presentation/widgets/custom_app_bar.dart';
import 'package:medical_app/presentation/widgets/password_field.dart';

class PasswordManagerScreen extends StatefulWidget {
  static const String passwordManagerRoute = '/passwordManager';
  const PasswordManagerScreen({super.key});

  @override
  State<PasswordManagerScreen> createState() => _PasswordManagerScreenState();
}

class _PasswordManagerScreenState extends State<PasswordManagerScreen> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: const CustomAppBar(
        title: Strings.passwordManager,
        showBack: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppPadding.p16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPasswordField(
              label: Strings.currentPassword,
              controller: _currentPasswordController,
              hint: "******",
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  Strings.forgetPassword,
                  style: getRegularTextStyle(
                    color: ColorManager.primaryColor,
                    fontSize: AppSize.s14.sp,
                  ).copyWith(decoration: TextDecoration.underline),
                ),
              ),
            ),
            Gap(AppSize.s16.h),
            _buildPasswordField(
              label: Strings.newPassword,
              controller: _newPasswordController,
              hint: "************",
            ),
            Gap(AppSize.s24.h),
            _buildPasswordField(
              label: Strings.confirmNewPassword,
              controller: _confirmPasswordController,
              hint: "************",
            ),
            Gap(AppSize.s40.h),
            ButtonWidget(
              radius: AppSize.s10,
              text: Strings.changePassword,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: getSemiBoldTextStyle(
            color: ColorManager.textColor,
            fontSize: AppSize.s16.sp,
          ),
        ),
        Gap(AppSize.s8.h),
        PasswordField(
          passwordController: controller,
          hintText: hint,
          showLockIcon: false,
        ),
      ],
    );
  }
}
