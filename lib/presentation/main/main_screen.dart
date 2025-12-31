import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_app/presentation/main/appointments/appointments_screen.dart';
import 'package:medical_app/presentation/main/chat/saved_screen.dart';
import 'package:medical_app/presentation/main/home/home_screen.dart';
import 'package:medical_app/presentation/main/profile/profile_screen.dart';
import 'package:medical_app/presentation/resources/assets_manager.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';

class MainScreen extends StatefulWidget {
  static const String mainRoute = '/main';

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final List<Widget> _pages = [
    HomeScreen(),
    AppointmentsScreen(),
    SavedScreen(),
    ProfileScreen(),
  ];

  int _currentIndex = 0;

  void _onItemTapped(int index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 0,
          selectedItemColor: ColorManager.primaryColor,
          unselectedItemColor: ColorManager.greyColor,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageAssets.home,
                colorFilter: ColorFilter.mode(
                  _currentIndex == 0
                      ? ColorManager.primaryColor
                      : ColorManager.greyColor,
                  BlendMode.srcIn,
                ),
              ),
              label: Strings.home,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageAssets.appointments,
                colorFilter: ColorFilter.mode(
                  _currentIndex == 1
                      ? ColorManager.primaryColor
                      : ColorManager.greyColor,
                  BlendMode.srcIn,
                ),
              ),
              label: Strings.appointments,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageAssets.saved,
                colorFilter: ColorFilter.mode(
                  _currentIndex == 2
                      ? ColorManager.primaryColor
                      : ColorManager.greyColor,
                  BlendMode.srcIn,
                ),
              ),
              label: Strings.saved,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageAssets.profile,
                colorFilter: ColorFilter.mode(
                  _currentIndex == 3
                      ? ColorManager.primaryColor
                      : ColorManager.greyColor,
                  BlendMode.srcIn,
                ),
              ),
              label: Strings.profile,
            ),
          ],
        ),
      ),
    );
  }
}
