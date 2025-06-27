import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer_pro/sizer.dart';

import 'app/appTheme/customColor.dart';
import 'app/modules/home/controllers/home_controller.dart';
import 'app/modules/splash/views/splash_view.dart';
import 'app/routes/app_pages.dart';

CustomColors getCustomColors(BuildContext context) {
  return Theme.of(context).extension<CustomColors>()!;
}

void main() {
  Get.put(HomeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Color primaryColor = const Color(0xFF1E88E5);

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        // ✅ Put your controllers here after Sizer is initialized
        Get.put(HomeController());
        return GetMaterialApp(
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          title: 'Sizer',
          themeMode: ThemeMode.system,
          theme: ThemeData(
            brightness: Brightness.light,
            fontFamily: 'Inter',
            primaryColor: primaryColor,
            scaffoldBackgroundColor: const Color(0xffF0F1F5),
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: primaryColor,
              secondary: primaryColor,
            ),
            appBarTheme: const AppBarTheme(
              foregroundColor: Colors.white,
            ),
            extensions: <ThemeExtension<dynamic>>[
              CustomColors.light,
            ],
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Inter',
            primaryColor: Colors.blue,
            scaffoldBackgroundColor: Colors.grey[900],
            colorScheme: ColorScheme.fromSwatch(
              brightness: Brightness.dark,
            ).copyWith(
              primary: Colors.blue,
              secondary: Colors.blue,
            ),
            appBarTheme: const AppBarTheme(
              foregroundColor: Colors.black,
            ),
            extensions: <ThemeExtension<dynamic>>[
              CustomColors.dark,
            ],
          ),
          home: SplashView(),
        );
      },
    );
  }
}
