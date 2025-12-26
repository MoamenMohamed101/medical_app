import 'package:flutter/material.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/widgets/custom_app_bar.dart';

class ChatScreen extends StatelessWidget {
  static const String chatRoute = '/chat';
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: const CustomAppBar(title: Strings.chat),
      body: const Center(child: Text(Strings.chat)),
    );
  }
}
