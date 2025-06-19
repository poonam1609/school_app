import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:school_app/HelperWidget/subMenu_getPages.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../HelperWidget/accountOverviewChart.dart';
import '../../../../HelperWidget/animatedNavigationBar.dart';
import '../../../../HelperWidget/calendarWidget.dart';
import '../../../../HelperWidget/classStrengthChart.dart';
import '../../../../HelperWidget/customDrawer.dart';
import '../../../../HelperWidget/dashBoardGrid.dart';
import '../../../../HelperWidget/feeCollectionChart.dart';
import '../../../../HelperWidget/newAdmissionChart.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeController homeController = Get.put<HomeController>(HomeController());
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: homeController,
      builder: (controller) {
        return WillPopScope(
          onWillPop: () async {
            if (controller.previousNavIndex.value !=
                controller.selectedNavIndex.value) {
              controller.goBackToPrevious(); // Go to the actual previous page
              return false;
            }
            return true;
          },
          child: Scaffold(
            key: controller.scaffoldKey,
            appBar: AppBar(
              centerTitle: true,
              // backgroundColor: Color(0xffFFFFFF),
              toolbarHeight: 10.h,
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: SvgPicture.asset(
                    'assets/image/homelogo_img.svg',
                    height: 4.h,
                  ),
                ),
              ],

              leading: IconButton(
                icon: Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  controller.scaffoldKey.currentState?.openDrawer();
                },
              ),
              elevation: 2,
            ),
            drawer: CustomDrawer(),
            body: Obx(() {
              final selectedPage = controller.selectedNavIndex.value;
              if (selectedPage == 0) {
                // Show dashboard stack only on index 0
                return Stack(
                  children: [
                    SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2.h),
                          Text(
                            "Good Morning!",
                            style: TextStyle(color: Color(0xffA6A6A6)),
                          ),
                          Text(
                            "David",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 7.sp,
                            ),
                          ),
                          SizedBox(height: 3.h),
                          DashboardGrid(),
                          SizedBox(height: 4.h),
                          AccountOverviewChart(),
                          SizedBox(height: 4.h),
                          FeeCollectionChart(),
                          SizedBox(height: 4.h),
                          ClassStrengthChart(),
                          SizedBox(height: 4.h),
                          NewAdmissionsChart(),
                          SizedBox(height: 4.h),
                          CalendarWidget(),
                          SizedBox(height: 9.h),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: AnimatedNavigationBar(),
                    ),
                  ],
                );
              }
              // For all other pages
              return pageMap[selectedPage] ??
                  const Center(child: Text("Page not found"));
            }),
          ),
        );
      },
    );
  }
}
