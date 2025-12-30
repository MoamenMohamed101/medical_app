import 'package:flutter/material.dart';
import 'package:medical_app/presentation/forgot_password/widgets/forget_password_view_body.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/widgets/custom_app_bar.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String forgotPasswordRoute = '/forgot_password';

  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: const CustomAppBar(),
      body: ForgotPasswordViewBody(),
    );
  }
}
