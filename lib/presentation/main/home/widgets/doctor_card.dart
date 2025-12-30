import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_app/presentation/main/home/models/doctor_model.dart';
import 'package:medical_app/presentation/main/home/screens/doctor_details_screen.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';
import 'package:medical_app/presentation/widgets/button_widget.dart';

class DoctorCard extends StatelessWidget {
  final DoctorModel doctor;

  final bool showPrice;
  final double? width;

  const DoctorCard({
    super.key,
    required this.doctor,
    this.showPrice = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width * 0.75,
      padding: EdgeInsets.all(AppPadding.p10.w),
      decoration: BoxDecoration(
        color: ColorManager.babyBlue.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(AppSize.s12.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: AppSize.s30.r,
                backgroundImage: NetworkImage(doctor.image),
              ),
              Gap(AppSize.s8.h),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.name,
                      style: getMediumTextStyle(
                        color: ColorManager.textColor,
                        fontSize: FontSizeManager.s14.sp,
                      ),
                    ),
                    Gap(AppSize.s4.h),
                    Text(
                      doctor.specialty,
                      style: getRegularTextStyle(
                        color: ColorManager.greyColor,
                        fontSize: FontSizeManager.s10.sp,
                      ),
                    ),
                    Gap(AppSize.s8.h),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        Gap(AppSize.s2.w),
                        Text(
                          '${doctor.rating}',
                          style: getRegularTextStyle(
                            color: ColorManager.textColor,
                            fontSize: FontSizeManager.s10.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (showPrice)
                Text(
                  '\$${doctor.price.toInt()}',
                  style: getBoldTextStyle(
                    color: ColorManager.primaryColor,
                    fontSize: FontSizeManager.s18.sp,
                  ),
                ),
            ],
          ),
          Gap(AppSize.s8.h),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Color(0xff00E908),
                radius: AppSize.s5.r,
              ),
              Gap(AppSize.s8.w),
              Text(
                doctor.availability,
                style: getRegularTextStyle(
                  color: ColorManager.greyColor,
                  fontSize: FontSizeManager.s12.sp,
                ),
              ),
              Spacer(),
              ButtonWidget(
                radius: AppSize.s8.r,
                width: AppSize.s80.w,
                height: AppSize.s28.h,
                text: Strings.bookNow,
                color: ColorManager.primaryColor,
                textColor: ColorManager.whiteColor,
                onTap: () {
                  context.push(
                    DoctorDetailsScreen.doctorDetailsRoute,
                    extra: doctor,
                  );
                },
                isSmallButton: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
