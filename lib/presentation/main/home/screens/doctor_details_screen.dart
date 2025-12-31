import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_app/presentation/main/home/models/doctor_model.dart';
import 'package:medical_app/presentation/main/home/screens/book_appointment_screen.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';
import 'package:medical_app/presentation/widgets/button_widget.dart';

class DoctorDetailsScreen extends StatefulWidget {
  static const String doctorDetailsRoute = '/doctor_details';
  final DoctorModel doctor;

  const DoctorDetailsScreen({super.key, required this.doctor});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  // int selectedDayIndex = 1; // "Thu 25 Des" selected in image
  // int selectedTimeIndex =
  //     -1; // No time selection explicitly shown in image (just chips), let's say none or handle toggling

  // final List<Map<String, String>> days = [
  //   {'day': 'Today', 'date': '24 Des'},
  //   {'day': 'Thu', 'date': '25 Des'}, // Selected
  //   {'day': 'Sat', 'date': '27 Des'},
  //   {'day': 'Sun', 'date': '29 Des'},
  // ];

  // final List<String> times = ['7:00 PM', '8:00 PM', '8:30 PM', '9:30 PM'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(AppSize.s16.h),
                  _buildSectionTitle(Strings.about),
                  Gap(AppSize.s8.h),
                  Text(
                    "Lorem ipsum dolor sit amet consectetur. Quam nullam sagittis ut nunct. Lorem ipsum dolor sit amet consectetur. Quam nullam sagittis ut nunct.Lorem ipsum dolor sit amet consectetur. Quam nullam sagittis ut nunct.",
                    style: getRegularTextStyle(
                      color: ColorManager.greyColor,
                      fontSize: FontSizeManager.s12.sp,
                    ),
                  ),
                  Gap(AppSize.s16.h),
                  // _buildSectionTitle('${Strings.day}:'), // Colon in image
                  // Gap(AppSize.s12.h),
                  // _buildDaySelector(),
                  // Gap(AppSize.s16.h),
                  // _buildSectionTitle('${Strings.time}:'), // Colon in image
                  // Gap(AppSize.s12.h),
                  // _buildTimeSelector(),
                  // Gap(AppSize.s16.h),
                  _buildSectionTitle(Strings.reviews),
                  Gap(AppSize.s12.h),
                  _buildReviewsList(),
                  Gap(AppSize.s10.h),
                  Center(
                    child: Text(
                      Strings.seeMoreLowerCase,
                      style: getSemiBoldTextStyle(
                        color: ColorManager.primaryColor,
                        fontSize: FontSizeManager.s14.sp,
                      ).copyWith(decoration: TextDecoration.underline),
                    ),
                  ),
                  Gap(AppSize.s24.h),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(AppPadding.p16.w),
        child: ButtonWidget(
          radius: AppSize.s12.r,
          onTap: () {
            context.push(
              BookAppointmentScreen.bookAppointmentRoute,
              extra: widget.doctor,
            );
          },
          text: Strings.bookNow,
          color: ColorManager.primaryColor,
          textColor: ColorManager.whiteColor,
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + AppPadding.p10.h,
        left: AppPadding.p16.w,
        right: AppPadding.p16.w,
        bottom: AppPadding.p20.h,
      ),
      decoration: BoxDecoration(
        color: ColorManager.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppSize.s24.r),
          bottomRight: Radius.circular(AppSize.s24.r),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: ColorManager.whiteColor,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.bookmark_border,
                    color: ColorManager.whiteColor,
                  ),
                  Gap(AppSize.s16.w),
                  const Icon(Icons.share, color: ColorManager.whiteColor),
                ],
              ),
            ],
          ),
          Gap(AppSize.s10.h),
          Row(
            children: [
              CircleAvatar(
                radius: AppSize.s35.r,
                backgroundImage: NetworkImage(widget.doctor.image),
              ),
              Gap(AppSize.s16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.doctor.name,
                      style: getSemiBoldTextStyle(
                        color: ColorManager.whiteColor,
                        fontSize: FontSizeManager.s18.sp,
                      ),
                    ),
                    Text(
                      widget.doctor.specialty,
                      style: getRegularTextStyle(
                        color: ColorManager.whiteColor.withValues(alpha: 0.8),
                        fontSize: FontSizeManager.s12.sp,
                      ),
                    ),
                    Gap(AppSize.s4.h),
                    Row(
                      children: [
                        ...List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: AppSize.s16.w,
                          ),
                        ),
                        Gap(AppSize.s4.w),
                        Text(
                          '(4)',
                          style: getRegularTextStyle(
                            color: ColorManager.whiteColor,
                            fontSize: FontSizeManager.s12.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Gap(AppSize.s20.h),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: AppSize.s40.h,
                  decoration: BoxDecoration(
                    color: ColorManager.whiteColor,
                    borderRadius: BorderRadius.circular(AppSize.s12.r),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    Strings.message,
                    style: getSemiBoldTextStyle(
                      color: ColorManager.primaryColor,
                      fontSize: FontSizeManager.s14.sp,
                    ),
                  ),
                ),
              ),
              Gap(AppSize.s16.w),
              Expanded(
                child: Container(
                  height: AppSize.s40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s12.r),
                    border: Border.all(color: ColorManager.whiteColor),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    Strings.review,
                    style: getSemiBoldTextStyle(
                      color: ColorManager.whiteColor,
                      fontSize: FontSizeManager.s14.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: getSemiBoldTextStyle(
        color: ColorManager.textColor,
        fontSize: FontSizeManager.s16.sp,
      ),
    );
  }

  // Widget _buildDaySelector() {
  //   return SizedBox(
  //     height: AppSize.s60.h,
  //     child: ListView.separated(
  //       scrollDirection: Axis.horizontal,
  //       itemCount: days.length,
  //       separatorBuilder: (context, index) => Gap(AppSize.s12.w),
  //       itemBuilder: (context, index) {
  //         final isSelected = index == selectedDayIndex;
  //         return GestureDetector(
  //           onTap: () {
  //             setState(() {
  //               selectedDayIndex = index;
  //             });
  //           },
  //           child: Container(
  //             width: AppSize.s70.w,
  //             decoration: BoxDecoration(
  //               color: isSelected
  //                   ? ColorManager.primaryColor.withValues(alpha: 0.15)
  //                   : ColorManager.whiteColor,
  //               borderRadius: BorderRadius.circular(AppSize.s12.r),
  //               border: Border.all(
  //                 color: isSelected
  //                     ? Colors.transparent
  //                     : ColorManager.lightGrey,
  //               ),
  //             ),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Text(
  //                   days[index]['day']!,
  //                   style: getRegularTextStyle(
  //                     color: isSelected
  //                         ? ColorManager.primaryColor
  //                         : ColorManager.greyColor,
  //                     fontSize: FontSizeManager.s14.sp,
  //                   ),
  //                 ),
  //                 Gap(AppSize.s4.h),
  //                 Text(
  //                   days[index]['date']!,
  //                   style: getSemiBoldTextStyle(
  //                     color: isSelected
  //                         ? ColorManager.primaryColor
  //                         : ColorManager.greyColor,
  //                     fontSize: FontSizeManager.s14.sp,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  // Widget _buildTimeSelector() {
  //   return SizedBox(
  //     height: AppSize.s40.h,
  //     child: ListView.separated(
  //       scrollDirection: Axis.horizontal,
  //       itemCount: times.length,
  //       separatorBuilder: (context, index) => Gap(AppSize.s12.w),
  //       itemBuilder: (context, index) {
  //         return Container(
  //           padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
  //           alignment: Alignment.center,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(AppSize.s12.r),
  //             border: Border.all(color: ColorManager.lightGrey),
  //           ),
  //           child: Text(
  //             times[index],
  //             style: getRegularTextStyle(
  //               color: ColorManager.greyColor,
  //               fontSize: FontSizeManager.s14.sp,
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  Widget _buildReviewsList() {
    return Column(
      children: List.generate(3, (index) {
        return Column(
          children: [
            Row(
              children: List.generate(
                5,
                (i) =>
                    Icon(Icons.star, color: Colors.amber, size: AppSize.s16.w),
              ),
            ),
            Gap(AppSize.s8.h),
            Text(
              "The doctor was extremely professional and took the time to explain my condition in a very clear and calm way. I felt comfortable throughout the whole visit and really appreciated the care.",
              style: getRegularTextStyle(
                color: ColorManager.greyColor,
                fontSize: FontSizeManager.s12.sp,
              ),
            ),
            if (index != 2)
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
                child: Divider(
                  color: ColorManager.lightGrey.withValues(alpha: 0.5),
                ),
              ),
          ],
        );
      }),
    );
  }
}
