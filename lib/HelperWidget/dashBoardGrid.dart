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
          title: 'Total Students',
          value: controller.totalStudents.value.toString(),
         image: SvgPicture.asset("assets/icons/Icon_student.svg"),
          // color: Color(0xFF4A90E2),
        ),
        DashboardCard(
          title: 'Total Revenue',

          value: '₹${(controller.totalRevenue.value / 1000).toStringAsFixed(0)}K',
          image: SvgPicture.asset("assets/icons/Icon_revenue.svg"),
          // color: Colors.green,
        ),
        DashboardCard(
          title: 'Total Employees',
          value: controller.totalEmployees.value.toString(),
          image: SvgPicture.asset("assets/icons/Icon_employee.svg"),
          // color: Colors.orange,
        ),
        DashboardCard(
          title: 'Total Profit',
          value: '₹${(controller.totalProfit.value / 1000).toStringAsFixed(0)}K',
          image: SvgPicture.asset("assets/icons/Icon_profit.svg"),
          // color: Colors.purple,
        ),
      ],
    );
  }
}