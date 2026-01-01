import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';

class TextFromFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final bool enabled;
  final bool centerText;
  final void Function()? onTap;
  final bool isNotes;
  final String? errorText;
  final bool readOnly;

  const TextFromFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.onFieldSubmitted,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputAction = TextInputAction.done,
    this.focusNode,
    this.enabled = true,
    this.onTap,
    this.centerText = false,
    this.isNotes = false,
    this.errorText,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        textDirection: TextDirection.ltr,
        readOnly: readOnly,
        textAlign: centerText ? TextAlign.center : TextAlign.start,
        maxLines: isNotes ? 5 : 1,
        minLines: isNotes ? 5 : 1,
        textAlignVertical: isNotes
            ? TextAlignVertical.top
            : TextAlignVertical.center,
        controller: controller,
        focusNode: focusNode,
        validator: validator,
        obscureText: obscureText,
        keyboardType: isNotes ? TextInputType.multiline : keyboardType,
        textInputAction: isNotes ? TextInputAction.newline : textInputAction,
        style: getRegularTextStyle(
          color: ColorManager.textColor,
          fontSize: FontSizeManager.s16.sp,
        ),
        enabled: enabled,
        onFieldSubmitted: onFieldSubmitted,
        cursorColor: ColorManager.primaryColor,
        onTap: onTap,
        decoration: InputDecoration(
          errorText: errorText,
          // helperText: "",
          // helperStyle: getRegularTextStyle(
          //   color: ColorManager.greyColor,
          //   fontSize: AppSize.s8.sp,
          // ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          // suffixIconColor: ColorManager.errorColor,
          prefixIconColor: ColorManager.textColor,
          contentPadding: EdgeInsets.symmetric(
            vertical: AppPadding.p18.h,
            horizontal: AppPadding.p12.w,
          ),

          hintText: hintText,
          filled: true,
          fillColor: ColorManager.whiteColor,
          hintStyle: getRegularTextStyle(
            color: ColorManager.greyColor,
            fontSize: FontSizeManager.s16.sp,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s14.r),
            borderSide: BorderSide(
              color: ColorManager.formFieldsBorderColor,
              width: AppSize.s1.w,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s14.r),
            borderSide: BorderSide(
              color: ColorManager.primaryColor,
              width: AppSize.s1.w,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s14.r),
            borderSide: BorderSide(color: ColorManager.errorColor),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s14.r),
            borderSide: BorderSide(
              color: ColorManager.errorColor,
              width: AppSize.s1.w,
            ),
          ),
        ),
      ),
    );
  }
}
