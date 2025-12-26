import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_app/presentation/auth/forgot_password/forget_password_screen.dart';

import 'package:medical_app/presentation/auth/login/widgets/login_form_section.dart';
import 'package:medical_app/presentation/auth/login/widgets/login_header_section.dart';
import 'package:medical_app/presentation/auth/login/widgets/sign_up_prompt_section.dart';
import 'package:medical_app/presentation/auth/login/widgets/social_sign_in_section.dart';
import 'package:medical_app/presentation/auth/register/register_screen.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';

class LoginScreen extends StatefulWidget {
  static const String loginRoute = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    // TODO: Implement login logic
  }

  void _handleForgetPassword() {
    context.push(ForgetPasswordScreen.forgotPasswordRoute);
  }

  void _handleGoogleSignIn() {
    // TODO: Implement Google sign in
  }

  void _handleFacebookSignIn() {
    // TODO: Implement Facebook sign in
  }

  void _handleSignUp() {
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
                  emailController: _emailController,
                  passwordController: _passwordController,
                  onForgetPassword: _handleForgetPassword,
                  onLogin: _handleLogin,
                ),
                Gap(AppSize.s40.h),
                SocialSignInSection(
                  onGoogleSignIn: _handleGoogleSignIn,
                  onFacebookSignIn: _handleFacebookSignIn,
                ),
                Gap(AppSize.s25.h),
                SignUpPromptSection(onSignUp: _handleSignUp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
