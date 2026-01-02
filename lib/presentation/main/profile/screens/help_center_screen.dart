import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';
import 'package:medical_app/presentation/widgets/custom_app_bar.dart';

class HelpCenterScreen extends StatelessWidget {
  static const String helpCenterRoute = '/helpCenter';
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: const CustomAppBar(title: Strings.helpCenter, showBack: true),
      body: Center(
        child: Text(
          Strings.helpCenter,
          style: getMediumTextStyle(
            color: ColorManager.textColor,
            fontSize: AppSize.s20.sp,
          ),
        ),
      ),
    );
  }
}
