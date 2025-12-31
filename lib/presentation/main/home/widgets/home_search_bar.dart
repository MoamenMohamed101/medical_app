import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:medical_app/presentation/main/home/screens/voice_search_dialog.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';

class HomeSearchBar extends StatelessWidget {
  final VoidCallback? onTap;
  final bool readOnly;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool showMic;
  final bool autoFocus;

  const HomeSearchBar({
    super.key,
    this.onTap,
    this.readOnly = false,
    this.controller,
    this.onChanged,
    this.autoFocus = false,
    this.showMic = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s50.h,
      decoration: BoxDecoration(
        color: ColorManager.whiteColor,
        borderRadius: BorderRadius.circular(AppSize.s12.r),
        border: Border.all(color: ColorManager.lightGrey),
      ),
      child: TextFormField(
        controller: controller,
        onTap: onTap,
        readOnly: readOnly,
        onChanged: onChanged,
        autofocus: autoFocus,
        style: getRegularTextStyle(
          color: ColorManager.textColor,
          fontSize: FontSizeManager.s14.sp,
        ),
        decoration: InputDecoration(
          hintText: Strings.searchHint,
          hintStyle: getRegularTextStyle(
            color: ColorManager.greyColor,
            fontSize: FontSizeManager.s14.sp,
          ),
          prefixIcon: const Icon(Icons.search, color: ColorManager.greyColor),
          suffixIcon: showMic
              ? IconButton(
                  icon: const Icon(Icons.mic, color: ColorManager.greyColor),
                  onPressed: () async {
                    if (readOnly && onTap != null) {
                      onTap!();
                    } else {
                      final result = await showDialog<String>(
                        context: context,
                        builder: (context) => const VoiceSearchDialog(),
                      );
                      if (result != null && controller != null) {
                        controller!.text = result;
                        if (onChanged != null) {
                          onChanged!(result);
                        }
                      }
                    }
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: AppPadding.p12.h),
        ),
        cursorColor: ColorManager.primaryColor,
      ),
    );
  }
}
