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
  final bool isReversed;

  const AppointmentActionButtons({
    super.key,
    required this.firstButtonText,
    required this.onFirstTap,
    this.secondButtonText,
    this.onSecondTap,
    this.isReversed = false,
  });

  @override
  Widget build(BuildContext context) {
    final firstButton = Expanded(
      child: ButtonWidget(
        radius: AppSize.s8.r,
        height: AppSize.s40.h,
        text: firstButtonText,
        color: ColorManager.primaryColor,
        textColor: ColorManager.whiteColor,
        onTap: onFirstTap,
        isSmallButton: true,
      ),
    );

    final secondButton = secondButtonText != null
        ? Expanded(
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
          )
        : null;

    return Row(
      children: isReversed
          ? [
              if (secondButton != null) ...[secondButton, Gap(AppSize.s12.w)],
              firstButton,
            ]
          : [
              firstButton,
              if (secondButton != null) ...[Gap(AppSize.s12.w), secondButton],
            ],
    );
  }
}
