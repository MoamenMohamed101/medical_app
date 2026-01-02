import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_app/presentation/main/home/models/doctor_model.dart';
import 'package:medical_app/presentation/main/home/models/specialty_model.dart';
import 'package:medical_app/presentation/main/home/screens/specialties_screen.dart';
import 'package:medical_app/presentation/main/home/screens/search_screen.dart';
import 'package:medical_app/presentation/main/home/widgets/appointment_card.dart';
import 'package:medical_app/presentation/main/home/widgets/doctor_card.dart';
import 'package:medical_app/presentation/main/home/widgets/home_app_bar.dart';
import 'package:medical_app/presentation/main/home/widgets/home_search_bar.dart';
import 'package:medical_app/presentation/main/home/widgets/section_header.dart';
import 'package:medical_app/presentation/main/home/widgets/specialty_item.dart';
import 'package:medical_app/presentation/resources/assets_manager.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';

class HomeScreen extends StatelessWidget {
  static const String homeRoute = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: AppPadding.p16.w,
            ),
            child: Column(
              children: [
                Gap(AppSize.s10.h),
                const HomeAppBar(),
                // Gap(AppSize.s16.h),
                // HomeSearchBar(
                //   onTap: () {
                //     context.push(SearchScreen.searchRoute);
                //   },
                //   readOnly: true,
                // ),
                Gap(AppSize.s16.h),
                const HomeAppointmentCard(),
                Gap(AppSize.s16.h),
                HomeSpecialtiesSection(
                  onSeeAll: () {
                    context.push(SpecialtiesScreen.specialtiesRoute);
                  },
                ),
                Gap(AppSize.s12.h),
                const HomePopularDoctorsSection(),
                Gap(AppSize.s20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Appointment card widget
class HomeAppointmentCard extends StatelessWidget {
  const HomeAppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppointmentCard(
      doctor: DoctorModel(
        name: 'Dr. Daniel Rodriguez',
        image:
            'https://img.freepik.com/free-photo/portrait-successful-man-having-stubble-posing-with-broad-smile-keeping-arms-folded_171337-1267.jpg',
        specialty: 'Interventional Cardiologist',
        rating: 0,
        reviews: 0,
        availability: '',
      ),
      date: DateTime.now(),
    );
  }
}

// Specialties section widget
class HomeSpecialtiesSection extends StatelessWidget {
  final VoidCallback onSeeAll;

  const HomeSpecialtiesSection({super.key, required this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: Strings.specialties,
          onSeeAll: onSeeAll,
          hasSeeAllButton: true,
        ),
        const SpecialtiesGrid(),
      ],
    );
  }
}

// Specialties grid widget
class SpecialtiesGrid extends StatelessWidget {
  const SpecialtiesGrid({super.key});

  static final List<SpecialtyModel> _specialties = [
    SpecialtyModel(name: Strings.cardiology, iconPath: ImageAssets.cardiology),
    SpecialtyModel(name: Strings.gynecology, iconPath: ImageAssets.gynecology),
    SpecialtyModel(name: Strings.odontology, iconPath: ImageAssets.odontology),
    SpecialtyModel(
      name: Strings.neurosurgery,
      iconPath: ImageAssets.neurosurgery,
    ),
    SpecialtyModel(
      name: Strings.ophthalmology,
      iconPath: ImageAssets.ophthalmology,
    ),
    SpecialtyModel(
      name: Strings.internalMedicine,
      iconPath: ImageAssets.internalMedicine,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _specialties.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: AppSize.s12.w,
        mainAxisSpacing: AppSize.s12.w,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        return SpecialtyItem(
          specialty: _specialties[index],
          iconHieght: AppSize.s40.h,
          iconWidth: AppSize.s40.w,
          textStyle: getRegularTextStyle(
            color: ColorManager.primaryColor,
            fontSize: FontSizeManager.s12.sp,
          ),
        );
      },
    );
  }
}

// Popular doctors section widget
class HomePopularDoctorsSection extends StatelessWidget {
  const HomePopularDoctorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(title: Strings.popularDoctors),
        const PopularDoctorsList(),
      ],
    );
  }
}

// Popular doctors list widget
class PopularDoctorsList extends StatelessWidget {
  const PopularDoctorsList({super.key});

  static final List<DoctorModel> _doctors = [
    DoctorModel(
      name: 'Dr. Daniel Rodriguez',
      image:
          'https://img.freepik.com/free-photo/portrait-successful-man-having-stubble-posing-with-broad-smile-keeping-arms-folded_171337-1267.jpg',
      specialty: 'Interventional Cardiologist',
      rating: 3,
      reviews: 120,
      availability: "Sunday : Thursday",
    ),
    DoctorModel(
      name: 'Dr. Daniel Rodriguez',
      image:
          'https://img.freepik.com/free-photo/portrait-successful-man-having-stubble-posing-with-broad-smile-keeping-arms-folded_171337-1267.jpg',
      specialty: 'Interventional Cardiologist',
      rating: 4,
      reviews: 120,
      availability: "Sunday : Thursday",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s150.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _doctors.length,
        separatorBuilder: (context, index) => Gap(AppSize.s12.w),
        itemBuilder: (context, index) {
          return DoctorCard(doctor: _doctors[index]);
        },
      ),
    );
  }
}
