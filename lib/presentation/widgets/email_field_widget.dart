import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/widgets/text_form_field_widget.dart';

class EmailField extends StatelessWidget {
  final TextEditingController emailController;

  const EmailField({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFromFieldWidget(
          hintText: Strings.email.tr(),
          controller: emailController,
          prefixIcon: Icon(Icons.email),
        ),
      ],
    );
  }
}
