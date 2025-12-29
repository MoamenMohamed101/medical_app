import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_app/presentation/main/home/models/doctor_model.dart';
import 'package:medical_app/presentation/main/home/models/specialty_model.dart';
import 'package:medical_app/presentation/main/home/widgets/specialties_screen.dart';
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

class HomeScreen extends StatefulWidget {
  static const String homeRoute = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<SpecialtyModel> specialties = [
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

  final List<DoctorModel> doctors = [
    DoctorModel(
      name: 'Dr. Daniel Rodriguez',
      image:
          'https://img.freepik.com/free-photo/portrait-successful-man-having-stubble-posing-with-broad-smile-keeping-arms-folded_171337-1267.jpg',
      specialty: 'Interventional Cardiologist',
      rating: 4.8,
      reviews: 120,
      availability: "Sunday : Thursday",
    ),
    DoctorModel(
      name: 'Dr. Daniel Rodriguez',
      image:
          'https://img.freepik.com/free-photo/portrait-successful-man-having-stubble-posing-with-broad-smile-keeping-arms-folded_171337-1267.jpg',
      specialty: 'Interventional Cardiologist',
      rating: 4.8,
      reviews: 120,
      availability: "Sunday : Thursday",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(AppSize.s10.h),
              const HomeAppBar(),
              Gap(AppSize.s16.h),
              const HomeSearchBar(),
              Gap(AppSize.s16.h),
              AppointmentCard(
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
              ),
              Gap(AppSize.s16.h),

              SectionHeader(
                title: Strings.specialties,
                onSeeAll: () {
                  context.push(SpecialtiesScreen.specialtiesRoute);
                },
                hasSeeAllButton: true,
              ),
              SizedBox(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: specialties.length,
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: AppSize.s12.w,
                    mainAxisSpacing: AppSize.s12.w,
                    childAspectRatio: 1.0,
                  ),
                  itemBuilder: (context, index) {
                    return SpecialtyItem(
                      specialty: specialties[index],
                      iconHieght: AppSize.s40.h,
                      iconWidth: AppSize.s40.w,
                      textStyle: getRegularTextStyle(
                        color: ColorManager.primaryColor,
                        fontSize: FontSizeManager.s12.sp,
                      ),
                    );
                  },
                ),
              ),
              Gap(AppSize.s12.h),
              SectionHeader(title: Strings.popularDoctors),
              SizedBox(
                height: AppSize.s150.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: doctors.length,
                  separatorBuilder: (context, index) => Gap(AppSize.s12.w),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 360.w,
                      child: DoctorCard(doctor: doctors[index]),
                    );
                  },
                ),
              ),
              Gap(AppSize.s20.h),
            ],
          ),
        ),
      ),
    );
  }
}
