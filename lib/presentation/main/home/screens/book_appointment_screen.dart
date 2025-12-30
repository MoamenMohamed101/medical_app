import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_app/presentation/main/home/models/doctor_model.dart';
import 'package:medical_app/presentation/main/home/screens/appointment_confirmed_screen.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';
import 'package:medical_app/presentation/widgets/button_widget.dart';
import 'package:medical_app/presentation/widgets/custom_app_bar.dart';

class BookAppointmentScreen extends StatefulWidget {
  static const String bookAppointmentRoute = '/book_appointment';
  final DoctorModel doctor;

  const BookAppointmentScreen({super.key, required this.doctor});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool isDateExpanded = false;

  String selectedGender = Strings.female;
  int selectedDayIndex = 1;
  int selectedTimeIndex = 0;

  final List<Map<String, String>> days = [
    {'day': 'Today', 'date': '24 Des'},
    {'day': 'Thu', 'date': '25 Des'},
    {'day': 'Sat', 'date': '27 Des'},
    {'day': 'Sun', 'date': '29 Des'},
  ];

  final List<String> times = ['7:00 PM', '8:00 PM', '8:30 PM', '9:30 PM'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: const CustomAppBar(title: Strings.yourAppointment),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(AppSize.s16.h),
              _buildDateSection(),
              Gap(AppSize.s24.h),
              _buildTextField(
                controller: _nameController,
                hint: Strings.patientName,
              ),
              Gap(AppSize.s16.h),
              _buildTextField(
                controller: _ageController,
                hint: Strings.patientAge,
              ),
              Gap(AppSize.s16.h),
              _buildTextField(
                controller: _phoneController,
                hint: Strings.phoneNumber,
                prefix: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p12.w,
                    vertical: AppPadding.p14.h,
                  ),
                  child: Text(
                    "20+ |",
                    style: getRegularTextStyle(
                      color: ColorManager.blackColor,
                      fontSize: FontSizeManager.s14.sp,
                    ),
                  ),
                ),
              ),
              Gap(AppSize.s24.h),
              Text(
                "${Strings.gender}:",
                style: getMediumTextStyle(
                  color: ColorManager.textColor,
                  fontSize: FontSizeManager.s16.sp,
                ),
              ),
              Gap(AppSize.s12.h),
              Row(
                children: [
                  _buildGenderChip(Strings.female),
                  Gap(AppSize.s12.w),
                  _buildGenderChip(Strings.male),
                  Gap(AppSize.s12.w),
                  _buildGenderChip(Strings.kid),
                ],
              ),
              Gap(AppSize.s40.h),
              ButtonWidget(
                radius: AppSize.s12.r,
                onTap: () {
                  context.push(
                    AppointmentConfirmedScreen.appointmentConfirmedRoute,
                    extra: widget.doctor,
                  );
                },
                text: Strings.confirm,
                color: ColorManager.primaryColor,
                textColor: ColorManager.whiteColor,
              ),
              Gap(AppSize.s30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateSection() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: ColorManager.lightBlue.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppSize.s12.r),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isDateExpanded = !isDateExpanded;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p16.w,
                vertical: AppPadding.p12.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "25 Jan, Thu, 7:00 pm",
                    style: getMediumTextStyle(
                      color: ColorManager.primaryColor,
                      fontSize: FontSizeManager.s14.sp,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    isDateExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: ColorManager.primaryColor,
                  ),
                ],
              ),
            ),
          ),
          if (isDateExpanded) ...[
            Container(
              color: ColorManager.whiteColor,
              padding: EdgeInsets.all(AppPadding.p16.w),
              child: Column(
                children: [
                  SizedBox(
                    height: AppSize.s60.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: days.length,
                      separatorBuilder: (context, index) => Gap(AppSize.s12.w),
                      itemBuilder: (context, index) {
                        final isSelected = index == selectedDayIndex;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDayIndex = index;
                            });
                          },
                          child: Container(
                            width: AppSize.s70.w,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? ColorManager.primaryColor.withValues(
                                      alpha: 0.15,
                                    )
                                  : ColorManager.whiteColor,
                              borderRadius: BorderRadius.circular(
                                AppSize.s12.r,
                              ),
                              border: Border.all(
                                color: isSelected
                                    ? Colors.transparent
                                    : ColorManager.lightGrey,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  days[index]['day']!,
                                  style: getRegularTextStyle(
                                    color: isSelected
                                        ? ColorManager.primaryColor
                                        : ColorManager.greyColor,
                                    fontSize: FontSizeManager.s14.sp,
                                  ),
                                ),
                                Gap(AppSize.s4.h),
                                Text(
                                  days[index]['date']!,
                                  style: getSemiBoldTextStyle(
                                    color: isSelected
                                        ? ColorManager.primaryColor
                                        : ColorManager.greyColor,
                                    fontSize: FontSizeManager.s14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Gap(AppSize.s16.h),
                  SizedBox(
                    height: AppSize.s40.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: times.length,
                      separatorBuilder: (context, index) => Gap(AppSize.s12.w),
                      itemBuilder: (context, index) {
                        final isSelected = index == selectedTimeIndex;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTimeIndex = index;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppPadding.p16.w,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? ColorManager.primaryColor.withValues(
                                      alpha: 0.2,
                                    )
                                  : ColorManager.whiteColor,
                              borderRadius: BorderRadius.circular(
                                AppSize.s12.r,
                              ),
                              border: Border.all(
                                color: isSelected
                                    ? Colors.transparent
                                    : ColorManager.lightGrey,
                              ),
                            ),
                            child: Text(
                              times[index],
                              style: getRegularTextStyle(
                                color: isSelected
                                    ? ColorManager.primaryColor
                                    : ColorManager.greyColor,
                                fontSize: FontSizeManager.s14.sp,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    Widget? prefix,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: getRegularTextStyle(
          color: ColorManager.greyColor,
          fontSize: FontSizeManager.s14.sp,
        ),
        fillColor: ColorManager.whiteColor,
        filled: true,
        prefixIcon: prefix,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppPadding.p16.w,
          vertical: AppPadding.p16.h,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s12.r),
          borderSide: BorderSide(
            color: ColorManager.lightGrey.withValues(alpha: 0.5),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s12.r),
          borderSide: BorderSide(
            color: ColorManager.lightGrey.withValues(alpha: 0.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s12.r),
          borderSide: const BorderSide(color: ColorManager.primaryColor),
        ),
      ),
    );
  }

  Widget _buildGenderChip(String gender) {
    final isSelected = selectedGender == gender;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedGender = gender;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: AppPadding.p12.h),
          decoration: BoxDecoration(
            color: isSelected
                ? ColorManager.primaryColor.withValues(alpha: 0.1)
                : ColorManager.whiteColor,
            borderRadius: BorderRadius.circular(AppSize.s12.r),
            border: Border.all(
              color: isSelected
                  ? ColorManager.primaryColor
                  : ColorManager.lightGrey,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            gender,
            style: getMediumTextStyle(
              color: isSelected
                  ? ColorManager.primaryColor
                  : ColorManager.textColor,
              fontSize: FontSizeManager.s14.sp,
            ),
          ),
        ),
      ),
    );
  }
}
