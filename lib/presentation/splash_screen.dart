import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_app/presentation/auth/login/login_screen.dart';
import 'package:medical_app/presentation/resources/assets_manager.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';

class SplashScreen extends StatefulWidget {
  static const String splashRoute = '/';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.2,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();

    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: SvgPicture.asset(ImageAssets.splash),
        ),
      ),
    );
  }

  void _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  void _goNext() {
    context.go(LoginScreen.loginRoute);
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }
}
