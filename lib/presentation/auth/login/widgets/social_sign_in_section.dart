import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:medical_app/presentation/auth/login/widgets/social_sign_in_button.dart';
import 'package:medical_app/presentation/resources/assets_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';

class SocialSignInSection extends StatelessWidget {
  final VoidCallback onGoogleSignIn;
  final VoidCallback onFacebookSignIn;

  const SocialSignInSection({
    super.key,
    required this.onGoogleSignIn,
    required this.onFacebookSignIn,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDividerWithText(),
        Gap(AppSize.s25.h),
        _buildSocialButtons(),
      ],
    );
  }

  Widget _buildDividerWithText() {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.shade300, thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
          child: Text(
            Strings.orSignInWith,
            style: getMediumTextStyle(
              color: Colors.grey,
              fontSize: FontSizeManager.s14.sp,
            ),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey.shade300, thickness: 1)),
      ],
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialSignInButton(
          iconAsset: ImageAssets.google,
          onTap: onGoogleSignIn,
        ),
        Gap(AppSize.s30.w),
        SocialSignInButton(
          iconAsset: ImageAssets.facebookLogo,
          onTap: onFacebookSignIn,
        ),
      ],
    );
  }
}
