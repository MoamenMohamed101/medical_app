import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/presentation/resources/routes_manager.dart';
import 'package:medical_app/presentation/resources/theme_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static final MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final AppPreferences _appPreferences = instance<AppPreferences>();

  // @override
  // didChangeDependencies() {
  //   _appPreferences.getLocalLanguage().then((locale) {
  //     context.setLocale(locale);
  //   });
  //   super.didChangeDependencies();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return ScreenUtilInit(
  //     designSize: Size(AppSize.s357, AppSize.s812),
  //     child: MaterialApp.router(
  //       // localizationsDelegates: context.localizationDelegates,
  //       // supportedLocales: context.supportedLocales,
  //       // locale: context.locale,
  //       locale: DevicePreview.locale(context),
  //       builder: DevicePreview.appBuilder,
  //       debugShowCheckedModeBanner: false,
  //       routerConfig: GoRouterConfig.router,
  //       theme: getApplicationTheme(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(AppSize.s357, AppSize.s812),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: GoRouterConfig.router,
        theme: getApplicationTheme(),
      ),
    );
  }
}
