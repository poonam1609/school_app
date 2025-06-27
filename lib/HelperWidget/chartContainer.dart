import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';

import '../app/appTheme/customColor.dart';

class ChartContainer extends StatelessWidget {
  final String title;
  final Widget child;

  const ChartContainer({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final customColors = Theme.of(context).extension<CustomColors>();
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: customColors?.containerBackgroundColor,
        borderRadius: BorderRadius.circular(1.h),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade900.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 6.sp,
                fontWeight: FontWeight.bold,
                color:customColors?.primaryTextColor,
              ),
            ),
            SizedBox(height: 2.h),
            child,
          ],
        ),
      ),
    );
  }
}