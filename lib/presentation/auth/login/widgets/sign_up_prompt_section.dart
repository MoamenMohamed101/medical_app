import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/widgets/text_button_widget.dart';

class SignUpPromptSection extends StatelessWidget {
  final VoidCallback onSignUp;

  const SignUpPromptSection({super.key, required this.onSignUp});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            Strings.dontHaveAccount,
            style: getMediumTextStyle(
              color: ColorManager.textColor,
              fontSize: FontSizeManager.s14.sp,
            ),
          ),
          TextButtonWidget(
            text: Strings.signUp,
            fontSize: FontSizeManager.s14.sp,
            color: ColorManager.primaryColor,
            onPressed: onSignUp,
          ),
        ],
      ),
    );
  }
}
