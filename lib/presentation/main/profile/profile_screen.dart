import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_app/presentation/main/profile/screens/edit_information_screen.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';
import 'package:medical_app/presentation/widgets/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  static const String profileRoute = '/profile';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: const CustomAppBar(title: Strings.myProfile, showBack: false),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppPadding.p16.w),
        child: Column(
          children: [
            _buildProfileHeader(context),
            Gap(AppSize.s30.h),
            _buildMenuItem(title: Strings.privacyPolicy),
            _buildMenuItem(title: Strings.helpCenter),
            _buildMenuItem(title: Strings.changeLanguage),
            _buildMenuItem(title: Strings.deleteAccount),
            _buildMenuItem(title: Strings.logout),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 35.r,
          backgroundImage: const NetworkImage(
            'https://img.freepik.com/free-photo/portrait-successful-man-having-stubble-posing-with-broad-smile-keeping-arms-folded_171337-1267.jpg',
          ),
        ),
        Gap(AppSize.s16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ahmed Mahmoud',
                style: getSemiBoldTextStyle(
                  color: ColorManager.textColor,
                  fontSize: FontSizeManager.s16.sp,
                ),
              ),
              Gap(AppSize.s4.h),
              Text(
                '+123 567 89000',
                style: getRegularTextStyle(
                  color: ColorManager.greyColor,
                  fontSize: FontSizeManager.s12.sp,
                ),
              ),
              Text(
                'Janedoe@example.com',
                style: getRegularTextStyle(
                  color: ColorManager.greyColor,
                  fontSize: FontSizeManager.s12.sp,
                ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            context.push(EditInformationScreen.editInformationRoute);
          },
          child: Text(
            Strings.edit,
            style: getRegularTextStyle(
              color: ColorManager.primaryColor,
              fontSize: FontSizeManager.s14.sp,
            ).copyWith(decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem({required String title, VoidCallback? onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      title: Text(
        title,
        style: getSemiBoldTextStyle(
          color: ColorManager.textColor,
          fontSize: FontSizeManager.s16.sp,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: ColorManager.textColor,
        size: AppSize.s16,
      ),
    );
  }
}
