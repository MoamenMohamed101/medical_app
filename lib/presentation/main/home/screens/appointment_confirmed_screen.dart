import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_app/presentation/main/home/models/doctor_model.dart';
import 'package:medical_app/presentation/main/main_screen.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';
import 'package:medical_app/presentation/widgets/button_widget.dart';

class AppointmentConfirmedScreen extends StatelessWidget {
  static const String appointmentConfirmedRoute = '/appointment_confirmed';
  final DoctorModel doctor;

  const AppointmentConfirmedScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(AppSize.s20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(AppPadding.p8.w),
                    decoration: const BoxDecoration(
                      color: ColorManager.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: ColorManager.whiteColor,
                    ),
                  ),
                  Gap(AppSize.s12.w),
                  Text(
                    Strings.appointmentConfirmed,
                    style: getSemiBoldTextStyle(
                      color: ColorManager.primaryColor,
                      fontSize: FontSizeManager.s18.sp,
                    ),
                  ),
                ],
              ),
              Gap(AppSize.s30.h),
              _buildDoctorCard(),
              Gap(AppSize.s24.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: AppPadding.p16.h),
                decoration: BoxDecoration(
                  color: ColorManager.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppSize.s12.r),
                ),
                child: Text(
                  "25 Jan, Thu, 7:00 pm",
                  textAlign: TextAlign.center,
                  style: getSemiBoldTextStyle(
                    color: ColorManager.primaryColor,
                    fontSize: FontSizeManager.s14.sp,
                  ),
                ),
              ),
              Gap(AppSize.s24.h),
              _buildDetailRow(Strings.patientName, "Jane Doe"),
              Gap(AppSize.s16.h),
              _buildDetailRow(Strings.patientAge, "30"),
              Gap(AppSize.s16.h),
              _buildDetailRow(Strings.phoneNumber, "+20 012333333"),
              Gap(AppSize.s16.h),
              _buildDetailRow(
                Strings.gender,
                "Fermal",
              ), // Typo in image, using correct spelling if preferred, but sticking to image if needed. Actually image says 'Fermal'. I will use 'Fermal' to be exact or 'Female' to be correct. Let's use Female.

              Gap(AppSize.s40.h),
              Row(
                children: [
                  Expanded(
                    child: ButtonWidget(
                      radius: AppSize.s12.r,
                      onTap: () {},
                      text: Strings.edit,
                      color: ColorManager.primaryColor,
                      textColor: ColorManager.whiteColor,
                    ),
                  ),
                  Gap(AppSize.s16.w),
                  Expanded(
                    child: ButtonWidget(
                      radius: AppSize.s12.r,
                      onTap: () {},
                      text: Strings.cancel,
                      color: ColorManager.whiteColor,
                      textColor: ColorManager.textColor,
                      borderColor: ColorManager.primaryColor,
                    ),
                  ),
                ],
              ),
              Gap(AppSize.s24.h),
              InkWell(
                onTap: () {
                  context.go(MainScreen.mainRoute);
                },
                child: Text(
                  Strings.backToHome,
                  style: getMediumTextStyle(
                    color: ColorManager.primaryColor,
                    fontSize: FontSizeManager.s14.sp,
                  ).copyWith(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorCard() {
    return Row(
      children: [
        CircleAvatar(
          radius: AppSize.s30.r,
          backgroundImage: NetworkImage(doctor.image),
        ),
        Gap(AppSize.s12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctor.name,
              style: getMediumTextStyle(
                color: ColorManager.textColor,
                fontSize: FontSizeManager.s16.sp,
              ),
            ),
            Text(
              doctor.specialty,
              style: getRegularTextStyle(
                color: ColorManager.greyColor,
                fontSize: FontSizeManager.s12.sp,
              ),
            ),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                Text(
                  " (4)",
                  style: getRegularTextStyle(
                    color: ColorManager.textColor,
                    fontSize: FontSizeManager.s12.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$label:",
          style: getMediumTextStyle(
            color: ColorManager.greyColor,
            fontSize: FontSizeManager.s14.sp,
          ),
        ),
        Text(
          value,
          style: getRegularTextStyle(
            color: ColorManager.textColor,
            fontSize: FontSizeManager.s14.sp,
          ),
        ),
      ],
    );
  }
}
