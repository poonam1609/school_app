
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer_pro/sizer.dart';

import '../app/modules/home/controllers/home_controller.dart';
import 'chartContainer.dart';

class FeeCollectionChart extends StatelessWidget {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ChartContainer(
      title: 'Fee Details',
      child: Container(
        height: 25.h,
        child:
        PieChart(
          PieChartData(
            sections: controller.feeCollectionData.map((data) {
              return PieChartSectionData(
                borderSide: const BorderSide(
                  color: Colors.white, // Border color
                  width: 4,            // Border width
                ),
                value: data.percentage,
                title: '${data.percentage.toInt()}%',
                titlePositionPercentageOffset: 0.5,
badgeWidget: RotatedBox(quarterTurns: 1,),
                color: data.color,
                // color: Color(0xff1E88E5),
                radius: 45,
                titleStyle: TextStyle(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),

              );
            }).toList(),
            centerSpaceRadius: 50,

          ),
        ),
      ),
    );
  }
}