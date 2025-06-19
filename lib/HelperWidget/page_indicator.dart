import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer_pro/sizer.dart'; // If you're using sizer

class PageIndicator extends StatelessWidget {
  final int index;
  final RxInt currentPage;
  final Color activeColor;

  const PageIndicator({
    super.key,
    required this.index,
    required this.currentPage,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      margin: EdgeInsets.symmetric(horizontal: 1.w),
      width: currentPage.value == index ? 30 : 8,
      height: 1.h,
      decoration: BoxDecoration(
        color: currentPage.value == index ? activeColor :  Color(0xffB2D6FF),
        borderRadius: BorderRadius.circular(4),
      ),
    ));
  }
}
