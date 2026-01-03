import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:medical_app/presentation/main/home/models/doctor_model.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';
import 'package:medical_app/presentation/widgets/button_widget.dart';
import 'package:medical_app/presentation/widgets/custom_app_bar.dart';
import 'package:medical_app/presentation/widgets/text_form_field_widget.dart';

class ReviewScreen extends StatefulWidget {
  static const String reviewRoute = '/review';
  final DoctorModel doctor;

  const ReviewScreen({super.key, required this.doctor});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final TextEditingController _commentController = TextEditingController();
  int _rating = 0;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: const CustomAppBar(title: Strings.review),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p20.w),
          child: Column(
            children: [
              Gap(AppSize.s10.h),
              CircleAvatar(
                radius: AppSize.s60.r,
                backgroundImage: NetworkImage(widget.doctor.image),
              ),
              Gap(AppSize.s20.h),
              Text(
                widget.doctor.name,
                style: getSemiBoldTextStyle(
                  color: ColorManager.primaryColor,
                  fontSize: FontSizeManager.s20.sp,
                ),
              ),
              Gap(AppSize.s8.h),
              Text(
                widget.doctor.specialty,
                style: getRegularTextStyle(
                  color: ColorManager.greyColor,
                  fontSize: FontSizeManager.s14.sp,
                ),
              ),
              Gap(AppSize.s30.h),
              _buildRatingBar(),
              Gap(AppSize.s30.h),
              TextFromFieldWidget(
                hintText: Strings.enterYourComment,
                controller: _commentController,
                maxLines: 8,
                minLines: 8,
                fillColor: ColorManager.lightBlue.withOpacity(0.3),
              ),
              Gap(AppSize.s40.h),
              ButtonWidget(
                radius: AppSize.s14,
                text: Strings.addReview,
                onTap: () {
                  // Handle add review logic
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return InkWell(
          onTap: () {
            setState(() {
              _rating = index + 1;
            });
            print(_rating);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.s4.w),
            child: Icon(
              index < _rating ? Icons.star_rounded : Icons.star_outline_rounded,
              color: ColorManager.yellow,
              size: AppSize.s40.r,
            ),
          ),
        );
      }),
    );
  }
}
