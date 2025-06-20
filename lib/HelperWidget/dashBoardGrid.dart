import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer_pro/sizer.dart';

import '../app/modules/home/controllers/home_controller.dart';
import 'dashboardCard.dart';

class DashboardGrid extends StatelessWidget {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 1.5,
      crossAxisSpacing: 4.w,
      mainAxisSpacing: 1.5.h,
      children: [
        DashboardCard(
          backgroundImagePath: 'assets/image/home_bg_img1.jpg',
          title: 'Total Students',
          value: controller.totalStudents.value.toString(),
         image: SvgPicture.asset("assets/icons/Icon_student.svg",color: Colors.white,),
          // color: Color(0xFF4A90E2),
        ),
        DashboardCard(
          title: 'Total Revenue',
          backgroundImagePath:'assets/image/home_bg_img.jpg',
          value: '₹${(controller.totalRevenue.value / 1000).toStringAsFixed(0)}K',
          image: SvgPicture.asset("assets/icons/Icon_revenue.svg",color: Colors.white,),
          // color: Colors.green,
        ),
        DashboardCard(
          backgroundImagePath: 'assets/image/home_bg_img3.jpg',
          title: 'Total Employees',
          value: controller.totalEmployees.value.toString(),
          image: SvgPicture.asset("assets/icons/Icon_employee.svg",color: Colors.white,),
          // color: Colors.orange,
        ),
        DashboardCard(
          backgroundImagePath: 'assets/image/home_bg_img4.jpg',
          title: 'Total Profit',
          value: '₹${(controller.totalProfit.value / 1000).toStringAsFixed(0)}K',
          image: SvgPicture.asset("assets/icons/Icon_profit.svg",color: Colors.white,),
          // color: Colors.purple,
        ),
      ],
    );
  }
}