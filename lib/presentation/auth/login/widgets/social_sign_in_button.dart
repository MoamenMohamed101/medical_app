import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';

class SocialSignInButton extends StatelessWidget {
  final String iconAsset;
  final VoidCallback onTap;

  const SocialSignInButton({
    super.key,
    required this.iconAsset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSize.s50.r),
      child: Container(
        width: AppSize.s60.w,
        height: AppSize.s60.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
        ),
        child: Center(
          child: SvgPicture.asset(
            iconAsset,
            width: AppSize.s30.w,
            height: AppSize.s30.h,
          ),
        ),
      ),
    );
  }
}
