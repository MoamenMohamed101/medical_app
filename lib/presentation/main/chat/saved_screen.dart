import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:medical_app/presentation/main/home/models/doctor_model.dart';
import 'package:medical_app/presentation/main/home/widgets/doctor_card.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';
import 'package:medical_app/presentation/widgets/custom_app_bar.dart';

class SavedScreen extends StatelessWidget {
  static const String savedRoute = '/saved';
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DoctorModel> favoriteDoctors = [
      DoctorModel(
        name: 'Dr. Daniel Rodriguez',
        image:
            'https://img.freepik.com/free-photo/portrait-successful-man-having-stubble-posing-with-broad-smile-keeping-arms-folded_171337-1267.jpg',
        specialty: 'Interventional Cardiologist',
        rating: 4.0,
        reviews: 4,
        availability: "Sunday : Thursday",
      ),
      DoctorModel(
        name: 'Dr. Daniel Rodriguez',
        image:
            'https://img.freepik.com/free-photo/portrait-successful-man-having-stubble-posing-with-broad-smile-keeping-arms-folded_171337-1267.jpg',
        specialty: 'Interventional Cardiologist',
        rating: 4.0,
        reviews: 4,
        availability: "Sunday : Thursday",
      ),
    ];

    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: const CustomAppBar(title: Strings.saved, showBack: false),
      body: ListView.separated(
        padding: EdgeInsets.all(AppPadding.p16.w),
        itemCount: favoriteDoctors.length,
        separatorBuilder: (context, index) => Gap(AppSize.s16.h),
        itemBuilder: (context, index) {
          return DoctorCard(
            doctor: favoriteDoctors[index],
            width: double.infinity,
            headerTrailing: Icon(
              Icons.bookmark,
              color: ColorManager.primaryColor,
              size: AppSize.s24,
            ),
          );
        },
      ),
    );
  }
}
