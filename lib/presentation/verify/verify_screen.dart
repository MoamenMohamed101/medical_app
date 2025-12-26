import 'package:flutter/material.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/verify/widgets/verify_view_body.dart';

class VerifyScreen extends StatelessWidget {
  static const String verifyRoute = '/verify';

  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorManager.whiteColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: ColorManager.primaryColor),
      ),
      body: const VerifyViewBody(),
    );
  }
}
