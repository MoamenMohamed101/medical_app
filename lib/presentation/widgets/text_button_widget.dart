import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final void Function()? onPressed;

  const TextButtonWidget({
    super.key,
    required this.text,
    required this.color,
    required this.fontSize,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: getMediumTextStyle(color: color, fontSize: fontSize.sp).copyWith(
          decoration: TextDecoration.underline,
          decorationColor: color,
        ),
      ),
    );
  }
}
