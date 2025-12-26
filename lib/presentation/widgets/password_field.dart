import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const PasswordField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFromFieldWidget(
      hintText: hintText,
      controller: controller,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      prefixIcon: Icon(Icons.lock, color: ColorManager.primaryColor),
      suffixIcon: IconButton(
        onPressed: () {},
        icon: Icon(Icons.remove_red_eye, color: ColorManager.darkGrayColor),
      ),

      // errorText: (snapshot.data ?? true)
      //     ? null
      //     : Strings.invalidPassword.tr(),
    );
  }
}
