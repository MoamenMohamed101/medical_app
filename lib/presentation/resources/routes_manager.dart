import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_app/app/functions.dart';
import 'package:medical_app/presentation/auth/login/login_screen.dart';
import 'package:medical_app/presentation/auth/register/register_screen.dart';
import 'package:medical_app/presentation/forgot_password/forget_password_screen.dart';
import 'package:medical_app/presentation/main/appointments/appointments_screen.dart';
import 'package:medical_app/presentation/main/chat/chat_screen.dart';
import 'package:medical_app/presentation/main/home/home_screen.dart';
import 'package:medical_app/presentation/main/home/screens/notifications_screen.dart';
import 'package:medical_app/presentation/main/home/screens/special_screen.dart';
import 'package:medical_app/presentation/main/home/screens/specialties_screen.dart';
import 'package:medical_app/presentation/main/home/screens/search_screen.dart';
import 'package:medical_app/presentation/main/home/screens/doctor_details_screen.dart';
import 'package:medical_app/presentation/main/home/models/doctor_model.dart';
import 'package:medical_app/presentation/main/home/screens/book_appointment_screen.dart';
import 'package:medical_app/presentation/main/home/screens/appointment_confirmed_screen.dart';
import 'package:medical_app/presentation/main/main_screen.dart';
import 'package:medical_app/presentation/main/profile/profile_screen.dart';
import 'package:medical_app/presentation/reset_password/reset_password_screen.dart';
import 'package:medical_app/presentation/verify/verify_screen.dart';
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
        builder: (context, state) => RegisterScreen(),
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
      GoRoute(
        path: MainScreen.mainRoute,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: ChatScreen.chatRoute,
        builder: (context, state) => const ChatScreen(),
      ),
      GoRoute(
        path: ProfileScreen.profileRoute,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: AppointmentsScreen.appointmentsRoute,
        builder: (context, state) => const AppointmentsScreen(),
      ),
      GoRoute(
        path: HomeScreen.homeRoute,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: SpecialtiesScreen.specialtiesRoute,
        builder: (context, state) => const SpecialtiesScreen(),
      ),
      GoRoute(
        path: SpecialScreen.specialRoute,
        builder: (context, state) =>
            SpecialScreen(specialName: state.extra as String),
      ),
      GoRoute(
        path: NotificationsScreen.notificationRoute,
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: SearchScreen.searchRoute,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: DoctorDetailsScreen.doctorDetailsRoute,
        builder: (context, state) =>
            DoctorDetailsScreen(doctor: state.extra as DoctorModel),
      ),
      GoRoute(
        path: BookAppointmentScreen.bookAppointmentRoute,
        builder: (context, state) =>
            BookAppointmentScreen(doctor: state.extra as DoctorModel),
      ),
      GoRoute(
        path: AppointmentConfirmedScreen.appointmentConfirmedRoute,
        builder: (context, state) =>
            AppointmentConfirmedScreen(doctor: state.extra as DoctorModel),
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
