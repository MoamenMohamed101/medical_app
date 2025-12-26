import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_app/app/functions.dart';
import 'package:medical_app/presentation/auth/login/login_screen.dart';
import 'package:medical_app/presentation/auth/register/register_screen.dart';
import 'package:medical_app/presentation/auth/forgot_password/forget_password_screen.dart';
import 'package:medical_app/presentation/verify/verify_screen.dart';
import 'package:medical_app/presentation/verify/reset_password/reset_password_screen.dart';
import 'package:medical_app/presentation/splash_screen.dart';

class GoRouterConfig {
  static GoRouter get router => _router;
  static final GoRouter _router = GoRouter(
    navigatorKey: navigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: SplashScreen.splashRoute,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: LoginScreen.loginRoute,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: RegisterScreen.registerRoute,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: ForgetPasswordScreen.forgotPasswordRoute,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        path: VerifyScreen.verifyRoute,
        builder: (context, state) => const VerifyScreen(),
      ),
      GoRoute(
        path: ResetPasswordScreen.resetPasswordRoute,
        builder: (context, state) => const ResetPasswordScreen(),
      ),
    ],
  );

  static CustomTransitionPage getCustomTransitionPage({
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  }
}
