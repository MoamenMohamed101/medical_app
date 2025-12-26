import 'package:flutter/material.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/reset_password/widgets/reset_password_view_body.dart';
import 'package:medical_app/presentation/widgets/custom_app_bar.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const String resetPasswordRoute = '/reset_password';

  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: const CustomAppBar(),
      body: ResetPasswordViewBody(),
    );
  }
}
