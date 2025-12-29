import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/presentation/main/home/models/specialty_model.dart';
import 'package:medical_app/presentation/main/home/widgets/specialty_item.dart';
import 'package:medical_app/presentation/resources/assets_manager.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';
import 'package:medical_app/presentation/widgets/custom_app_bar.dart';

class SpecialtiesScreen extends StatelessWidget {
  static const String specialtiesRoute = '/specialties';
  const SpecialtiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SpecialtyModel> specialties = [
      SpecialtyModel(
        name: Strings.cardiology,
        iconPath: ImageAssets.cardiology,
      ),
      SpecialtyModel(
        name: Strings.gynecology,
        iconPath: ImageAssets.gynecology,
      ),
      SpecialtyModel(
        name: Strings.odontology,
        iconPath: ImageAssets.odontology,
      ),
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
      SpecialtyModel(
        name: Strings.pediatrics,
        iconPath: ImageAssets.pediatrics,
      ),
      SpecialtyModel(
        name: Strings.orthopedics,
        iconPath: ImageAssets.orthopedics,
      ),
    ];

    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: const CustomAppBar(title: Strings.specialties),
      body: Padding(
        padding: EdgeInsetsDirectional.all(AppPadding.p16.w),
        child: GridView.builder(
          itemCount: specialties.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppSize.s12.w,
            mainAxisSpacing: AppSize.s12.h,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (context, index) {
            return SpecialtyItem(
              specialty: specialties[index],
              iconHieght: AppSize.s80.h,
              iconWidth: AppSize.s80.w,
              textStyle: getMediumTextStyle(
                color: ColorManager.primaryColor,
                fontSize: FontSizeManager.s16.sp,
              ),
            );
          },
        ),
      ),
    );
  }
}
