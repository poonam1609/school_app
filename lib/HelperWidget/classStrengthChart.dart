
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer_pro/sizer.dart';

import '../app/modules/home/controllers/home_controller.dart';
import 'chartContainer.dart';

class ClassStrengthChart extends StatelessWidget {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ChartContainer(
      title: 'Class Wise Strength',
      child: Container(
        height: 25.h,
        child: BarChart(
          BarChartData(
gridData: FlGridData(

  show: true,
  drawHorizontalLine: false,
  drawVerticalLine: false,
  // horizontalInterval: maxValue / 4,
  // getDrawingHorizontalLine: (value) {
  //   return FlLine(
  //     color: Colors.grey.withOpacity(0.2),
  //     strokeWidth: 1,
  //   );
  // },
),

            alignment: BarChartAlignment.spaceAround,
            maxY: 80,
            barTouchData: BarTouchData(enabled: false),
            titlesData: FlTitlesData(

              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    if (value.toInt() >= 0 && value.toInt() < controller.classStrengthData.length) {
                      return Text(
                        controller.classStrengthData[value.toInt()].className,
                        style: TextStyle(fontSize: 6.sp),
                      );
                    }
                    return Text('');
                  },
                ),
              ),
            ),
            borderData: FlBorderData(
              
              show: true,border: Border(
               bottom: BorderSide(color: Color(0xffA6A6A6DD)),
               left: BorderSide(color: Color(0xffA6A6A6DD)),
            ),),
            barGroups: controller.classStrengthData.asMap().entries.map((entry) {
              return BarChartGroupData(

                x: entry.key,
                barRods: [
                  BarChartRodData(
                    gradient: LinearGradient(colors: [
                      Color(0xFF1E88E5).withOpacity(0.8),
                      Color(0xFFB2D6FF).withOpacity(0.06),],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,),
                    toY: entry.value.strength.toDouble(),
                    color: Color(0xFF4A90E2),
                    width: 50,
                    borderRadius: BorderRadius.circular(1),
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