import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';
import 'package:medical_app/presentation/widgets/custom_app_bar.dart';

class NotificationsScreen extends StatelessWidget {
  static const String notificationRoute = '/notifications';
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Strings.notification,
        titleColor: ColorManager.primaryColor,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p20.w,
          vertical: AppPadding.p20.h,
        ),
        children: [
          Text(
            'TODAY',
            style: getSemiBoldTextStyle(
              color: ColorManager.textColor,
              fontSize: FontSizeManager.s14.sp,
            ),
          ),
          SizedBox(height: AppSize.s20.h),
          const NotificationItem(
            icon: Icons.check_circle_outline,
            title: 'Booking Confirmed',
            description:
                'Your appointment with Dr. Mohamed Tarek – Cardiologist has been successfully confirmed.',
            time: '1h',
            isNew: true,
          ),
          Divider(
            color: ColorManager.lightGrayColor.withOpacity(0.3),
            height: AppSize.s40.h,
          ),
          const NotificationItem(
            icon: Icons.chat_bubble_outline,
            title: 'Clinic Message',
            description:
                'Please arrive 10 minutes before your appointment for check-in',
            time: '8h',
            isNew: true,
          ),
          Divider(
            color: ColorManager.lightGrayColor.withOpacity(0.3),
            height: AppSize.s40.h,
          ),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String time;
  final bool isNew;

  const NotificationItem({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.time,
    this.isNew = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: AppSize.s55.w,
          height: AppSize.s55.w,
          decoration: const BoxDecoration(
            color: ColorManager.primaryColor,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: ColorManager.whiteColor, size: AppSize.s28),
        ),
        SizedBox(width: AppSize.s14.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: getMediumTextStyle(
                      color: ColorManager.textColor,
                      fontSize: FontSizeManager.s16.sp,
                    ),
                  ),
                  Text(
                    time,
                    style: getRegularTextStyle(
                      color: ColorManager.lightGrayColor,
                      fontSize: FontSizeManager.s14.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.s8.h),
              Text(
                description,
                style: getRegularTextStyle(
                  color: ColorManager.greyColor,
                  fontSize: FontSizeManager.s14.sp,
                ).copyWith(height: 1.5),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
