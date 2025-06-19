import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer_pro/sizer.dart';

import '../app/modules/home/controllers/home_controller.dart';
import 'chartContainer.dart';

class NewAdmissionsChart extends StatelessWidget {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ChartContainer(
      title: 'New Admissions',
      child: Container(
        height: 25.h,
        child: BarChart(
          BarChartData(
            gridData: FlGridData(
              show: true,
              drawHorizontalLine: true,
              drawVerticalLine: true,
               // horizontalInterval: maxValue / 4,
               getDrawingHorizontalLine: (value) {
                 return FlLine(

                   color: Colors.grey.withOpacity(0.2),
                   strokeWidth: 1,
                 );
               },
              getDrawingVerticalLine:(value) {
                return FlLine(

                  color: Colors.grey.withOpacity(0.2),
                  strokeWidth: 1,
                );
              },
            ),
            alignment: BarChartAlignment.spaceAround,
            maxY: 40,
            barTouchData: BarTouchData(enabled: false),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    if (value.toInt() >= 0 && value.toInt() < controller.newAdmissions.length) {
                      return Text(
                        controller.newAdmissions[value.toInt()].period,
                        style: TextStyle(fontSize: 6.sp),
                      );
                    }
                    return Text('');
                  },
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            barGroups: controller.newAdmissions.asMap().entries.map((entry) {
              return BarChartGroupData(
                x: entry.key,
                barRods: [
                  BarChartRodData(
                    borderSide: BorderSide(color: Color(0xFF1E88E5),width: 2),
                    toY: entry.value.count.toDouble(),
                    color: Color(0xFFB2D6FF),
                    width: 50,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}