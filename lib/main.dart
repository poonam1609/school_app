import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/app/modules/home_work/views/home_work_view.dart';
import 'package:school_app/app/modules/splash/views/splash_view.dart';
import 'package:school_app/app/routes/app_pages.dart';
import 'package:sizer_pro/sizer.dart';

import 'app/modules/home/controllers/home_controller.dart';

void main() {
  Get.put(HomeController());
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  final Color primaryColor = Color(0xFF1E88E5);
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          title: 'Sizer',
          theme: ThemeData(
            fontFamily: 'Inter',
            primaryColor: primaryColor,
            scaffoldBackgroundColor: Color(0xffF0F1F5),
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: primaryColor,
              secondary: primaryColor,
            ),
          ),
          home:SplashView()
        );
      },
    );
  }
}

