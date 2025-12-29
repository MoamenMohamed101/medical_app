import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:medical_app/presentation/main/home/models/doctor_model.dart';
import 'package:medical_app/presentation/resources/assets_manager.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';

class AppointmentCard extends StatelessWidget {
  final DoctorModel doctor;
  final DateTime date;

  const AppointmentCard({super.key, required this.doctor, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: AppPadding.p16.w),
      child: Container(
        padding: EdgeInsetsDirectional.all(AppPadding.p16.w),
        decoration: BoxDecoration(
          color: ColorManager.primaryColor,
          borderRadius: BorderRadius.circular(AppSize.s20.r),
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: AppSize.s25.r,
                  backgroundImage: NetworkImage(doctor.image),
                ),
                SizedBox(width: AppSize.s12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.name,
                      style: getBoldTextStyle(
                        color: ColorManager.whiteColor,
                        fontSize: FontSizeManager.s16.sp,
                      ),
                    ),
                    Text(
                      doctor.specialty,
                      style: getRegularTextStyle(
                        color: ColorManager.whiteColor,
                        fontSize: FontSizeManager.s12.sp,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                CircleAvatar(
                  radius: AppSize.s25.r,
                  backgroundColor: ColorManager.whiteColor,
                  child: SvgPicture.asset(ImageAssets.phone),
                ),
              ],
            ),
            Gap(AppSize.s16.h),
            Row(
              children: [
                Text(
                  '15 Jan - Wednesday', // Hardcoded for demo matching image, usually formatted date
                  style: getRegularTextStyle(
                    color: ColorManager.yellow,
                    fontSize: FontSizeManager.s16.sp,
                  ),
                ),
                Spacer(),
                Text(
                  '8:00 pm', // Hardcoded for demo
                  style: getRegularTextStyle(
                    color: ColorManager.yellow,
                    fontSize: FontSizeManager.s14.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
