import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_app/presentation/forgot_password/forget_password_screen.dart';
import 'package:medical_app/presentation/auth/login/widgets/login_form_section.dart';
import 'package:medical_app/presentation/auth/login/widgets/login_header_section.dart';
import 'package:medical_app/presentation/auth/login/widgets/sign_up_prompt_section.dart';
import 'package:medical_app/presentation/auth/login/widgets/social_sign_in_section.dart';
import 'package:medical_app/presentation/auth/register/register_screen.dart';
import 'package:medical_app/presentation/main/main_screen.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';

class LoginScreen extends StatelessWidget {
  static const String loginRoute = '/login';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  void _handleLogin(BuildContext context) {
    context.go(MainScreen.mainRoute);
  }

  void _handleForgetPassword(BuildContext context) {
    context.push(ForgetPasswordScreen.forgotPasswordRoute);
  }

  void _handleGoogleSignIn() {
    // TODO: Implement Google sign in
  }

  void _handleFacebookSignIn() {
    // TODO: Implement Facebook sign in
  }

  void _handleSignUp(BuildContext context) {
    context.go(RegisterScreen.registerRoute);
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
                const LoginHeaderSection(),
                LoginFormSection(
                  onForgetPassword: () => _handleForgetPassword(context),
                  onLogin: () => _handleLogin(context),
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                Gap(AppSize.s40.h),
                SocialSignInSection(
                  onGoogleSignIn: _handleGoogleSignIn,
                  onFacebookSignIn: _handleFacebookSignIn,
                ),
                Gap(AppSize.s25.h),
                SignUpPromptSection(onSignUp: () => _handleSignUp(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
