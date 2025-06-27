import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:school_app/HelperWidget/customText.dart';
import 'package:sizer_pro/sizer.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  SplashController splashController = Get.put<SplashController>(SplashController());
  SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: splashController,
      builder: (controller) {
      return Scaffold(
        backgroundColor: Color(0xffB2D6FF),
        // backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: AnimatedBuilder(
            animation: splashController.controller,
            builder: (context, child) {
              return FadeTransition(
                opacity: splashController.fadeAnimation,
                child: ScaleTransition(
                  scale: splashController.scaleAnimation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(2.h),
                        decoration: BoxDecoration(
                        ),
                        child: SvgPicture.asset("assets/image/splash_img.svg"),
                      ),
                      SizedBox(height: 3.h),
                    Text('EduNest',style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff363939),fontSize: 11.sp.isNaN ? 11.3 : 11.sp,),),
                      SizedBox(height: 1.h),
                      Text('The Future of Learning, in Your Hands.',style: TextStyle( color: Color(0xff737373), fontSize: 5.sp.isNaN ? 5.5 : 5.sp,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    },);
  }
}
