import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';
import 'package:medical_app/presentation/widgets/custom_app_bar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  static const String privacyPolicyRoute = '/privacyPolicy';
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: const CustomAppBar(title: Strings.privacyPolicy, showBack: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppPadding.p16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.lastUpdate,
              style: getSemiBoldTextStyle(
                color: ColorManager.textColor,
                fontSize: FontSizeManager.s16.sp,
              ),
            ),
            Gap(AppSize.s16.h),
            _buildParagraph(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam. Fusce a scelerisque neque, sed accumsan metus.",
            ),
            Gap(AppSize.s16.h),
            _buildParagraph(
              "Nunc auctor tortor in dolor luctus, quis euismod urna tincidunt. Aenean arcu metus, bibendum at rhoncus at, volutpat ut lacus. Morbi pellentesque malesuada eros semper ultrices. Vestibulum lobortis enim vel neque auctor, a ultrices ex placerat. Mauris ut lacinia justo, sed suscipit tortor. Nam egestas nulla posuere neque tincidunt porta.",
            ),
            Gap(AppSize.s24.h),
            Text(
              Strings.termsAndConditions,
              style: getBoldTextStyle(
                color: ColorManager.primaryColor,
                fontSize: FontSizeManager.s18.sp,
              ),
            ),
            Gap(AppSize.s16.h),
            _buildListItem(
              "1",
              "Ut lacinia justo sit amet lorem sodales accumsan. Proin malesuada eleifend fermentum. Donec condimentum, nunc at rhoncus faucibus, ex nisi laoreet ipsum, eu pharetra eros est vitae orci. Morbi quis rhoncus mi. Nullam lacinia ornare accumsan. Duis laoreet, ex eget rutrum pharetra, lectus nisl posuere risus, vel facilisis nisi tellus ac turpis.",
            ),
            Gap(AppSize.s12.h),
            _buildListItem(
              "2",
              "Ut lacinia justo sit amet lorem sodales accumsan. Proin malesuada eleifend fermentum. Donec condimentum, nunc at rhoncus faucibus, ex nisi laoreet ipsum, eu pharetra eros est vitae orci. Morbi quis rhoncus mi. Nullam lacinia ornare accumsan. Duis laoreet, ex eget rutrum pharetra, lectus nisl posuere risus, vel facilisis nisi tellus ac turpis.",
            ),
            Gap(AppSize.s12.h),
            _buildListItem(
              "3",
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam.",
            ),
            Gap(AppSize.s12.h),
            _buildListItem(
              "4",
              "Nunc auctor tortor in dolor luctus, quis euismod urna tincidunt. Aenean arcu metus, bibendum at rhoncus at, volutpat ut lacus. Morbi pellentesque malesuada eros semper ultrices. Vestibulum lobortis enim vel neque auctor, a ultrices ex placerat. Mauris ut lacinia justo, sed suscipit tortor. Nam egestas nulla posuere neque.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Text(
      text,
      style: getRegularTextStyle(
        color: ColorManager.greyColor,
        fontSize: FontSizeManager.s14.sp,
      ),
    );
  }

  Widget _buildListItem(String number, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$number. ",
          style: getRegularTextStyle(
            color: ColorManager.greyColor,
            fontSize: FontSizeManager.s14.sp,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: getRegularTextStyle(
              color: ColorManager.greyColor,
              fontSize: FontSizeManager.s14.sp,
            ),
          ),
        ),
      ],
    );
  }
}
