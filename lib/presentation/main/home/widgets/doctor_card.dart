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

  const DoctorCard({super.key, required this.doctor, this.showPrice = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      padding: EdgeInsets.all(AppPadding.p10.w),
      decoration: BoxDecoration(
        color: ColorManager.babyBlue.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(AppSize.s12.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _DoctorHeaderSection(doctor: doctor, showPrice: showPrice),
          Gap(AppSize.s8.h),
          _DoctorFooterSection(doctor: doctor),
        ],
      ),
    );
  }
}

class _DoctorHeaderSection extends StatelessWidget {
  final DoctorModel doctor;
  final bool showPrice;

  const _DoctorHeaderSection({required this.doctor, required this.showPrice});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _DoctorAvatar(imageUrl: doctor.image),
        Gap(AppSize.s8.w),
        Expanded(child: _DoctorInfo(doctor: doctor)),
        if (showPrice) _DoctorPrice(price: doctor.price),
      ],
    );
  }
}

class _DoctorAvatar extends StatelessWidget {
  final String imageUrl;

  const _DoctorAvatar({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: AppSize.s30.r,
      backgroundImage: NetworkImage(imageUrl),
    );
  }
}

class _DoctorInfo extends StatelessWidget {
  final DoctorModel doctor;

  const _DoctorInfo({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          doctor.name,
          style: getMediumTextStyle(
            color: ColorManager.textColor,
            fontSize: FontSizeManager.s14.sp,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Gap(AppSize.s4.h),
        Text(
          doctor.specialty,
          style: getRegularTextStyle(
            color: ColorManager.greyColor,
            fontSize: FontSizeManager.s10.sp,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Gap(AppSize.s8.h),
        _DoctorRating(rating: doctor.rating),
      ],
    );
  }
}

class _DoctorRating extends StatelessWidget {
  final double rating;

  const _DoctorRating({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ..._buildStarIcons(rating),
        Gap(AppSize.s4.w),
        Text(
          '$rating',
          style: getRegularTextStyle(
            color: ColorManager.textColor,
            fontSize: FontSizeManager.s10.sp,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildStarIcons(double rating) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      IconData iconData;
      if (rating >= i) {
        iconData = Icons.star;
      } else if (rating >= i - 0.5) {
        iconData = Icons.star_half;
      } else {
        iconData = Icons.star_border;
      }
      stars.add(Icon(iconData, color: Colors.amber, size: AppSize.s16.r));
    }
    return stars;
  }
}

class _DoctorPrice extends StatelessWidget {
  final double price;

  const _DoctorPrice({required this.price});

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${price.toInt()}',
      style: getBoldTextStyle(
        color: ColorManager.primaryColor,
        fontSize: FontSizeManager.s18.sp,
      ),
    );
  }
}

class _DoctorFooterSection extends StatelessWidget {
  final DoctorModel doctor;
  static const Color _availabilityColor = Color(0xff00E908);

  const _DoctorFooterSection({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(backgroundColor: _availabilityColor, radius: AppSize.s5.r),
        Gap(AppSize.s8.w),
        Text(
          doctor.availability,
          style: getRegularTextStyle(
            color: ColorManager.greyColor,
            fontSize: FontSizeManager.s12.sp,
          ),
        ),
        const Spacer(),
        _BookButton(doctor: doctor),
      ],
    );
  }
}

class _BookButton extends StatelessWidget {
  final DoctorModel doctor;

  const _BookButton({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      radius: AppSize.s8.r,
      width: AppSize.s80.w,
      height: AppSize.s28.h,
      text: Strings.bookNow,
      color: ColorManager.primaryColor,
      textColor: ColorManager.whiteColor,
      onTap: () {
        context.push(DoctorDetailsScreen.doctorDetailsRoute, extra: doctor);
      },
      isSmallButton: true,
    );
  }
}
