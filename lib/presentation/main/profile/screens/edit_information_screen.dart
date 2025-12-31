import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/widgets/custom_app_bar.dart';
import 'package:medical_app/presentation/widgets/email_field_widget.dart';
import 'package:medical_app/presentation/widgets/phone_field_widget.dart';
import 'package:medical_app/presentation/widgets/text_form_field_widget.dart';
import 'package:medical_app/presentation/widgets/button_widget.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';
import 'package:medical_app/presentation/widgets/appointment_action_buttons.dart';

class EditInformationScreen extends StatefulWidget {
  static const String editInformationRoute = '/edit-information';
  const EditInformationScreen({super.key});

  @override
  State<EditInformationScreen> createState() => _EditInformationScreenState();
}

class _EditInformationScreenState extends State<EditInformationScreen> {
  final _nameController = TextEditingController(text: "Fatma Abdallah");
  final _phoneController = TextEditingController(text: "+123 567 89000");
  final _emailController = TextEditingController(text: "Janedoe@example.com");
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: const CustomAppBar(title: Strings.editInformation),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppPadding.p16.w),
        child: Column(
          children: [
            _buildProfileImage(),
            Gap(AppSize.s30.h),
            TextFromFieldWidget(
              hintText: Strings.patientName,
              controller: _nameController,
              prefixIcon: const Icon(
                Icons.person_outline,
                color: ColorManager.textColor,
              ),
            ),
            Gap(AppSize.s16.h),
            PhoneField(phoneController: _phoneController),
            Gap(AppSize.s16.h),
            EmailField(emailController: _emailController),
            Gap(AppSize.s16.h),
            _buildDatePicker(context),
            Gap(AppSize.s30.h),
            ButtonWidget(
              radius: AppSize.s12.r,
              text: Strings.updateProfile,
              onTap: () {
                // Update profile logic
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Stack(
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundImage: const NetworkImage(
            'https://img.freepik.com/free-photo/portrait-successful-man-having-stubble-posing-with-broad-smile-keeping-arms-folded_171337-1267.jpg',
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(AppSize.s4.r),
            decoration: const BoxDecoration(
              color: ColorManager.whiteColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.edit,
              color: ColorManager.primaryColor,
              size: AppSize.s20.r,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDatePicker(context),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p14.w,
          vertical: AppPadding.p18.h,
        ),
        decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(AppSize.s22.r),
          border: Border.all(color: ColorManager.formFieldsBorderColor),
          boxShadow: [
            BoxShadow(
              color: ColorManager.blackColor.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(Icons.calendar_today_outlined, color: ColorManager.textColor),
            Gap(AppSize.s12.w),
            Text(
              // Simple formatting for demo, ideally use intl
              "${_selectedDate.day} / ${_selectedDate.month} / ${_selectedDate.year}",
              style: getRegularTextStyle(color: ColorManager.textColor),
            ),
          ],
        ),
      ),
    );
  }

  void _showDatePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: ColorManager.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSize.s20.r),
          topRight: Radius.circular(AppSize.s20.r),
        ),
      ),
      builder: (context) {
        return Container(
          height: 350.h,
          padding: EdgeInsets.all(AppPadding.p16.w),
          child: Column(
            children: [
              Text(
                "${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}",
                style: getMediumTextStyle(
                  color: ColorManager.textColor,
                  fontSize: FontSizeManager.s18.sp,
                ),
              ),
              Gap(AppSize.s10.h),
              Divider(),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: _selectedDate,
                  onDateTimeChanged: (date) {
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                ),
              ),
              Gap(AppSize.s16.h),
              AppointmentActionButtons(
                firstButtonText: Strings.selected,
                onFirstTap: () {
                  context.pop();
                  setState(() {}); // refresh main UI
                },
                secondButtonText: Strings.cancel,
                onSecondTap: () => context.pop(),
                isReversed: true, // Matches [Cancel] [Selected] design
              ),
            ],
          ),
        );
      },
    );
  }
}
