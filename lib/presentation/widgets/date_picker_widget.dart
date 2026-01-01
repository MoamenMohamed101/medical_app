import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';
import 'package:medical_app/presentation/widgets/appointment_action_buttons.dart';

/// Shared component for displaying a date picker in a bottom sheet
class DatePickerBottomSheet {
  /// Shows a modal bottom sheet with a Cupertino date picker
  ///
  /// Parameters:
  /// - [context]: BuildContext for showing the bottom sheet
  /// - [initialDate]: The initially selected date (defaults to current date)
  /// - [onDateSelected]: Callback when user confirms date selection
  /// - [selectedButtonText]: Text for the confirm button (defaults to "Selected")
  /// - [cancelButtonText]: Text for the cancel button (defaults to "Cancel")
  static Future<DateTime?> show({
    required BuildContext context,
    DateTime? initialDate,
    required Function(DateTime selectedDate) onDateSelected,
    String selectedButtonText = 'Selected',
    String cancelButtonText = 'Cancel',
  }) async {
    DateTime tempSelectedDate = initialDate ?? DateTime.now();

    return showModalBottomSheet<DateTime>(
      context: context,
      backgroundColor: ColorManager.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSize.s20.r),
          topRight: Radius.circular(AppSize.s20.r),
        ),
      ),
      builder: (context) {
        return _DatePickerContent(
          initialDate: tempSelectedDate,
          selectedButtonText: selectedButtonText,
          cancelButtonText: cancelButtonText,
          onDateChanged: (date) {
            tempSelectedDate = date;
          },
          onSelected: () {
            context.pop();
            onDateSelected(tempSelectedDate);
          },
          onCancel: () => context.pop(),
        );
      },
    );
  }
}

class _DatePickerContent extends StatefulWidget {
  final DateTime initialDate;
  final String selectedButtonText;
  final String cancelButtonText;
  final Function(DateTime) onDateChanged;
  final VoidCallback onSelected;
  final VoidCallback onCancel;

  const _DatePickerContent({
    required this.initialDate,
    required this.selectedButtonText,
    required this.cancelButtonText,
    required this.onDateChanged,
    required this.onSelected,
    required this.onCancel,
  });

  @override
  State<_DatePickerContent> createState() => _DatePickerContentState();
}

class _DatePickerContentState extends State<_DatePickerContent> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s357.h,
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
          const Divider(),
          Expanded(
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: _selectedDate,
              onDateTimeChanged: (date) {
                setState(() {
                  _selectedDate = date;
                });
                widget.onDateChanged(date);
              },
            ),
          ),
          Gap(AppSize.s16.h),
          AppointmentActionButtons(
            firstButtonText: widget.selectedButtonText,
            onFirstTap: widget.onSelected,
            secondButtonText: widget.cancelButtonText,
            onSecondTap: widget.onCancel,
          ),
        ],
      ),
    );
  }
}

// USAGE EXAMPLE:
// 
// DateTime _selectedDate = DateTime.now();
//
// void _showDatePicker(BuildContext context) {
//   DatePickerBottomSheet.show(
//     context: context,
//     initialDate: _selectedDate,
    // onDateSelected: (selectedDate) {
    //   setState(() {
    //     _selectedDate = selectedDate;
    //   });
    // },
//     selectedButtonText: Strings.selected,
//     cancelButtonText: Strings.cancel,
//   );
// }