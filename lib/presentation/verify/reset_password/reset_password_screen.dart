import 'package:flutter/material.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/verify/reset_password/widgets/reset_password_view_body.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const String resetPasswordRoute = '/reset_password';

  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorManager.whiteColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: ColorManager.primaryColor),
      ),
      body: ResetPasswordViewBody(),
    );
  }
}
