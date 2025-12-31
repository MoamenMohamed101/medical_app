import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:medical_app/presentation/main/home/models/doctor_model.dart';
import 'package:medical_app/presentation/main/home/widgets/doctor_card.dart';

import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';
import 'package:medical_app/presentation/widgets/custom_app_bar.dart';
import 'package:medical_app/presentation/widgets/text_form_field_widget.dart';

class SpecialScreen extends StatefulWidget {
  final String specialName;
  static const String specialRoute = '/special-screen';
  const SpecialScreen({super.key, required this.specialName});

  @override
  State<SpecialScreen> createState() => _SpecialScreenState();
}

class _SpecialScreenState extends State<SpecialScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<DoctorModel> doctors = [
    DoctorModel(
      name: 'Dr. Daniel Rodriguez',
      image:
          'https://img.freepik.com/free-photo/portrait-successful-man-having-stubble-posing-with-broad-smile-keeping-arms-folded_171337-1267.jpg',
      specialty: 'Interventional Cardiologist',
      rating: 4.8,
      reviews: 120,
      availability: "Sunday : Thursday",
      price: 25,
    ),
    DoctorModel(
      name: 'Dr. Daniel Rodriguez',
      image:
          'https://img.freepik.com/free-photo/portrait-successful-man-having-stubble-posing-with-broad-smile-keeping-arms-folded_171337-1267.jpg',
      specialty: 'Interventional Cardiologist',
      rating: 4.8,
      reviews: 120,
      availability: "Sunday : Thursday",
      price: 50,
    ),
    DoctorModel(
      name: 'Dr. Daniel Rodriguez',
      image:
          'https://img.freepik.com/free-photo/portrait-successful-man-having-stubble-posing-with-broad-smile-keeping-arms-folded_171337-1267.jpg',
      specialty: 'Interventional Cardiologist',
      rating: 4.8,
      reviews: 120,
      availability: "Sunday : Thursday",
      price: 20,
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: CustomAppBar(title: widget.specialName),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: AppPadding.p16.w,
          ),
          child: Column(
            children: [
              Gap(AppSize.s10.h),
              TextFromFieldWidget(
                hintText: 'Dr Daniel',
                controller: _searchController,
                suffixIcon: Icon(Icons.mic, color: ColorManager.greyColor),
              ),
              Gap(AppSize.s16.h),
              Expanded(
                child: ListView.separated(
                  itemCount: doctors.length,
                  separatorBuilder: (context, index) => Gap(AppSize.s12.h),
                  itemBuilder: (context, index) {
                    return DoctorCard(doctor: doctors[index], showPrice: true);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
