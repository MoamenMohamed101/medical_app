import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:medical_app/presentation/widgets/appointment_action_buttons.dart';
import 'package:medical_app/presentation/main/home/models/doctor_model.dart';
import 'package:medical_app/presentation/main/home/widgets/doctor_card.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';
import 'package:medical_app/presentation/widgets/custom_app_bar.dart';

class AppointmentsScreen extends StatefulWidget {
  static const String appointmentsRoute = '/appointments';
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<DoctorModel> _upcomingAppointments = [
    DoctorModel(
      name: 'Dr. Daniel Rodriguez',
      image:
          'https://img.freepik.com/free-photo/portrait-successful-man-having-stubble-posing-with-broad-smile-keeping-arms-folded_171337-1267.jpg',
      specialty: 'Interventional Cardiologist',
      rating: 4.8,
      reviews: 120,
      availability: '',
      price: 25,
    ),
    DoctorModel(
      name: 'Dr. Daniel Rodriguez',
      image:
          'https://img.freepik.com/free-photo/portrait-successful-man-having-stubble-posing-with-broad-smile-keeping-arms-folded_171337-1267.jpg',
      specialty: 'Interventional Cardiologist',
      rating: 4.0,
      reviews: 60,
      availability: '',
      price: 25,
    ),
  ];

  final List<DoctorModel> _completedAppointments = [
    DoctorModel(
      name: 'Dr. Daniel Rodriguez',
      image:
          'https://img.freepik.com/free-photo/portrait-successful-man-having-stubble-posing-with-broad-smile-keeping-arms-folded_171337-1267.jpg',
      specialty: 'Interventional Cardiologist',
      rating: 4.5,
      reviews: 120,
      availability: '',
      price: 25,
    ),
    DoctorModel(
      name: 'Dr. Daniel Rodriguez',
      image:
          'https://img.freepik.com/free-photo/portrait-successful-man-having-stubble-posing-with-broad-smile-keeping-arms-folded_171337-1267.jpg',
      specialty: 'Interventional Cardiologist',
      rating: 4.8,
      reviews: 120,
      availability: '',
      price: 25,
    ),
  ];

  final List<DoctorModel> _canceledAppointments = [
    DoctorModel(
      name: 'Dr. Daniel Rodriguez',
      image:
          'https://img.freepik.com/free-photo/portrait-successful-man-having-stubble-posing-with-broad-smile-keeping-arms-folded_171337-1267.jpg',
      specialty: 'Interventional Cardiologist',
      rating: 4.8,
      reviews: 120,
      availability: '',
      price: 25,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: const CustomAppBar(
        title: Strings.yourAppointment,
        showBack: false,
      ),
      body: Column(
        children: [
          Container(
            color: ColorManager.whiteColor,
            child: TabBar(
              controller: _tabController,
              labelColor: ColorManager.primaryColor,
              unselectedLabelColor: ColorManager.greyColor,
              indicatorColor: ColorManager.primaryColor,
              indicatorWeight: 3,
              labelStyle: getSemiBoldTextStyle(
                color: ColorManager.primaryColor,
                fontSize: FontSizeManager.s14.sp,
              ),
              unselectedLabelStyle: getRegularTextStyle(
                color: ColorManager.greyColor,
                fontSize: FontSizeManager.s14.sp,
              ),
              tabs: const [
                Tab(text: Strings.upcoming),
                Tab(text: Strings.completed),
                Tab(text: Strings.canceled),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _AppointmentsList(
                  doctors: _upcomingAppointments,
                  actionType: ActionType.upcoming,
                ),
                _AppointmentsList(
                  doctors: _completedAppointments,
                  actionType: ActionType.completed,
                ),
                _AppointmentsList(
                  doctors: _canceledAppointments,
                  actionType: ActionType.canceled,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum ActionType { upcoming, completed, canceled }

class _AppointmentsList extends StatelessWidget {
  final List<DoctorModel> doctors;
  final ActionType actionType;

  const _AppointmentsList({required this.doctors, required this.actionType});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(AppPadding.p16.w),
      itemCount: doctors.length,
      separatorBuilder: (context, index) => Gap(AppSize.s16.h),
      itemBuilder: (context, index) {
        return DoctorCard(
          doctor: doctors[index],
          showPrice: true,
          priceColor: ColorManager.textColor,
          bottomWidget: _buildActions(context),
        );
      },
    );
  }

  Widget _buildActions(BuildContext context) {
    switch (actionType) {
      case ActionType.upcoming:
        return AppointmentActionButtons(
          firstButtonText: Strings.details,
          onFirstTap: () {
            // Handle details
          },
          secondButtonText: Strings.cancel,
          onSecondTap: () {
            // Handle cancel
          },
        );
      case ActionType.completed:
        return AppointmentActionButtons(
          firstButtonText: Strings.reBook,
          onFirstTap: () {
            // Handle re-booking
          },
          secondButtonText: Strings.addReview,
          onSecondTap: () {
            // Handle review
          },
        );
      case ActionType.canceled:
        return Row(
          children: [
            Expanded(
              child: AppointmentActionButtons(
                firstButtonText: Strings.reBook,
                onFirstTap: () {
                  // Handle re-booking
                },
              ),
            ),
            // Gap(AppSize.s12.w),
            Spacer(),
          ],
        );
    }
  }
}
