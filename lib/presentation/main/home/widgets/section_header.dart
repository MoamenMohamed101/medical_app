import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/widgets/text_button_widget.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAll;
  final bool hasSeeAllButton;

  const SectionHeader({
    super.key,
    required this.title,
    this.onSeeAll,
    this.hasSeeAllButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: getMediumTextStyle(
            color: ColorManager.textColor,
            fontSize: FontSizeManager.s18.sp,
          ),
        ),
        if (hasSeeAllButton)
          TextButtonWidget(
            text: Strings.seeAll,
            color: ColorManager.primaryColor,
            fontSize: FontSizeManager.s14.sp,
            onPressed: onSeeAll,
          ),
      ],
    );
  }
}
