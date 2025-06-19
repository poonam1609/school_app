import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer_pro/sizer.dart';

import '../app/modules/home/controllers/home_controller.dart';
import 'chartContainer.dart';

class AccountOverviewChart extends StatelessWidget {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ChartContainer(
      title: 'Account Overview',

      child: Container(
        height: 40.h,
        width: double.maxFinite,
        child: Obx(() {
          // Calculate dynamic max value for better scaling
          final maxValue = controller.accountData.isNotEmpty
              ? controller.accountData.map((e) => e.value).reduce((a, b) => a > b ? a : b)
              : 50000.0;

          return AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: LineChart(
              key: ValueKey(controller.accountData.length),
              LineChartData(
                minY: 0,
                maxY: maxValue * 1.1, // Add 10% padding
                gridData: FlGridData(

                  show: true,
                  drawHorizontalLine: true,
                  drawVerticalLine: false,
                  horizontalInterval: maxValue / 4,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.grey.withOpacity(0.2),
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 50,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          '₹${(value / 1000).toInt()}K',
                          style: TextStyle(
                            fontSize: 5.sp,
                            color: Colors.grey[600],
                          ),
                        );
                      },
                    ),
                  ),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {

                        if (value.toInt() >= 0 && value.toInt() < controller.accountData.length) {
                          return Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              controller.accountData[value.toInt()].month,
                              style: TextStyle(
                                fontSize: 5.sp,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }
                        return Text('');
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    // bottom: BorderSide(),
                    // left: BorderSide(),
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(

                    spots: controller.accountData.asMap().entries.map((entry) {
                      return FlSpot(entry.key.toDouble(), entry.value.value);
                    }).toList(),
                    isCurved: true,
                    curveSmoothness: 0.3,
                    color: Color(0xFF1E88E5),
                    barWidth: 2,
                    belowBarData: BarAreaData(
                      show: true,
                     color: Colors.transparent
                     /* gradient: LinearGradient(
                        colors: [
                          Color(0xFF4A90E2).withOpacity(0.3),
                          Color(0xFF4A90E2).withOpacity(0.05),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),*/
                    ),
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 5,
                          color: Color(0xffB2D6FF),
                          strokeWidth: 2,
                          strokeColor: Colors.white,
                        );
                      },
                    ),
                    shadow: Shadow(
                      blurRadius: 8,
                      color: Color(0xFF4A90E2).withOpacity(0.3),
                    ),
                  ),
                ],
                lineTouchData: LineTouchData(
                  enabled: true,
                  touchTooltipData: LineTouchTooltipData(

                    // tooltipBgColor: Color(0xFF4A90E2),
                    // tooltipRoundedRadius: 8,
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((touchedSpot) {
                        return LineTooltipItem(
                          '${controller.accountData[touchedSpot.spotIndex].month}\n₹${touchedSpot.y.toInt()}',
                          TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        );
                      }).toList();
                    },
                  ),
                  handleBuiltInTouches: true,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}