import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';

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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
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
                color: Colors.grey.shade800,
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