import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/widgets/text_form_field_widget.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController phoneController;

  const PhoneField({super.key, required this.phoneController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFromFieldWidget(
          hintText: Strings.phoneNumber.tr(),
          controller: phoneController,
          prefixIcon: Icon(
            Icons.phone_outlined,
            color: ColorManager.primaryColor,
          ),
          keyboardType: TextInputType.phone,
        ),
      ],
    );
  }
}
