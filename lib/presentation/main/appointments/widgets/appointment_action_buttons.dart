import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';
import 'package:medical_app/presentation/widgets/button_widget.dart';

class AppointmentActionButtons extends StatelessWidget {
  final String firstButtonText;
  final VoidCallback onFirstTap;
  final String? secondButtonText;
  final VoidCallback? onSecondTap;

  const AppointmentActionButtons({
    super.key,
    required this.firstButtonText,
    required this.onFirstTap,
    this.secondButtonText,
    this.onSecondTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ButtonWidget(
            radius: AppSize.s8.r,
            height: AppSize.s40.h,
            text: firstButtonText,
            color: ColorManager.primaryColor,
            textColor: ColorManager.whiteColor,
            onTap: onFirstTap,
            isSmallButton: true,
          ),
        ),
        if (secondButtonText != null) ...[
          Gap(AppSize.s12.w),
          Expanded(
            child: ButtonWidget(
              radius: AppSize.s8.r,
              height: AppSize.s40.h,
              text: secondButtonText!,
              color: ColorManager.whiteColor,
              textColor: ColorManager.primaryColor,
              borderColor: ColorManager.primaryColor,
              onTap: onSecondTap,
              isSmallButton: true,
            ),
          ),
        ],
      ],
    );
  }
}
