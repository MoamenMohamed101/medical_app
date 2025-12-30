import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_app/presentation/auth/login/login_screen.dart';
import 'package:medical_app/presentation/auth/register/widgets/register_form_section.dart';
import 'package:medical_app/presentation/auth/register/widgets/register_header_section.dart';
import 'package:medical_app/presentation/auth/register/widgets/sign_in_prompt_section.dart';
import 'package:medical_app/presentation/auth/register/widgets/social_sign_up_section.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';

class RegisterScreen extends StatelessWidget {
  static const String registerRoute = '/register';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  RegisterScreen({super.key});

  void _handleSignUp() {
    // TODO: Implement sign up logic
  }

  void _handleGoogleSignIn() {
    // TODO: Implement Google sign in
  }

  void _handleFacebookSignIn() {
    // TODO: Implement Facebook sign in
  }

  void _handleSignIn(BuildContext context) {
    context.go(LoginScreen.loginRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: AppPadding.p20.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const RegisterHeaderSection(),
                RegisterFormSection(
                  onSignUp: _handleSignUp,
                  emailController: emailController,
                  passwordController: passwordController,
                  confirmPasswordController: confirmPasswordController,
                ),
                Gap(AppSize.s40.h),
                SocialSignUpSection(
                  onGoogleSignIn: _handleGoogleSignIn,
                  onFacebookSignIn: _handleFacebookSignIn,
                ),
                Gap(AppSize.s25.h),
                SignInPromptSection(onSignIn: () => _handleSignIn(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
