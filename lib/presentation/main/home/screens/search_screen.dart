import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:medical_app/presentation/main/home/models/doctor_model.dart';
import 'package:medical_app/presentation/main/home/models/specialty_model.dart';
import 'package:medical_app/presentation/main/home/widgets/doctor_card.dart';
import 'package:medical_app/presentation/main/home/widgets/home_search_bar.dart';
import 'package:medical_app/presentation/resources/assets_manager.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';
import 'package:medical_app/presentation/widgets/custom_app_bar.dart';

class SearchScreen extends StatefulWidget {
  static const String searchRoute = '/search';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController(
    text: "Dr Daniel",
  );
  String _selectedFilter = 'All';

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
    SpecialtyModel(name: Strings.pediatrics, iconPath: ImageAssets.pediatrics),
    SpecialtyModel(
      name: Strings.orthopedics,
      iconPath: ImageAssets.orthopedics,
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
      price: 25,
    ),
    DoctorModel(
      name: 'Dr. Daniel Rodriguez',
      image:
          'https://img.freepik.com/free-photo/portrait-successful-man-having-stubble-posing-with-broad-smile-keeping-arms-folded_171337-1267.jpg',
      specialty: 'Interventional Cardiologist',
      rating: 4.8,
      reviews: 120,
      availability: "Sunday : Monday",
      price: 50,
    ),
    DoctorModel(
      name: 'Dr. Daniel Rodriguez',
      image:
          'https://img.freepik.com/free-photo/portrait-successful-man-having-stubble-posing-with-broad-smile-keeping-arms-folded_171337-1267.jpg',
      specialty: 'Interventional Cardiologist',
      rating: 4.8,
      reviews: 120,
      availability: "Sunday : Wednesday",
      price: 20,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<String> filters = ['All', ...specialties.map((s) => s.name)];

    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: const CustomAppBar(title: 'Search'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
          child: Column(
            children: [
              Gap(AppSize.s10.h),
              HomeSearchBar(controller: _searchController, autoFocus: true),
              Gap(AppSize.s16.h),
              SizedBox(
                height: AppSize.s40.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  separatorBuilder: (context, index) => Gap(AppSize.s10.w),
                  itemBuilder: (context, index) {
                    final filter = filters[index];
                    final isSelected = filter == _selectedFilter;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedFilter = filter;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppPadding.p16.w,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? ColorManager.primaryColor
                              : ColorManager.whiteColor,
                          borderRadius: BorderRadius.circular(AppSize.s24.r),
                          border: isSelected
                              ? null
                              : Border.all(color: ColorManager.lightGrey),
                        ),
                        child: Text(
                          filter,
                          style: getRegularTextStyle(
                            color: isSelected
                                ? ColorManager.whiteColor
                                : ColorManager.greyColor,
                            fontSize: FontSizeManager.s14.sp,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Gap(AppSize.s16.h),
              Expanded(
                child: ListView.separated(
                  itemCount: doctors.length,
                  separatorBuilder: (context, index) => Gap(AppSize.s16.h),
                  itemBuilder: (context, index) {
                    return DoctorCard(
                      doctor: doctors[index],
                      showPrice: true,
                      width: double.infinity,
                    );
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
