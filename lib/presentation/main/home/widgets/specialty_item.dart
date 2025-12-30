import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_app/presentation/main/home/models/specialty_model.dart';
import 'package:medical_app/presentation/main/home/screens/special_screen.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';

class SpecialtyItem extends StatelessWidget {
  final SpecialtyModel specialty;
  final double iconHieght, iconWidth;
  final TextStyle textStyle;

  const SpecialtyItem({
    super.key,
    required this.specialty,
    required this.iconHieght,
    required this.iconWidth,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(SpecialScreen.specialRoute, extra: specialty.name);
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.babyBlue.withValues(alpha: 0.03),
          borderRadius: BorderRadius.circular(AppSize.s12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              specialty.iconPath,
              height: iconHieght.h,
              width: iconWidth.w,
            ),
            SizedBox(height: AppSize.s8.h),
            Text(specialty.name, textAlign: TextAlign.center, style: textStyle),
          ],
        ),
      ),
    );
  }
}
