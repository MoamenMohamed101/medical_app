import 'package:flutter/material.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/widgets/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  static const String profileRoute = '/profile';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: const CustomAppBar(title: Strings.profile),
      body: const Center(child: Text(Strings.profile)),
    );
  }
}
