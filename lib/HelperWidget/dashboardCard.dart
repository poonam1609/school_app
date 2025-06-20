import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer_pro/sizer.dart';
import 'dart:ui';

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final SvgPicture image;
  final String backgroundImagePath;

  const DashboardCard({
    Key? key,
    required this.title,
    required this.value,
    required this.image,
    required this.backgroundImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(1.h),
      child: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              backgroundImagePath,
              fit: BoxFit.cover,
            ),
          ),

          // Blur effect
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2), // adjust blur intensity
              child: Container(
                color: Colors.black.withOpacity(0.4), // optional overlay for better text visibility
              ),
            ),
          ),

          // Content
          Padding(
            padding: EdgeInsets.all(1),
            child: Padding(
              padding: EdgeInsets.only(bottom: 2.h, left: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 5.5.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                        ),
                        child: image,
                      ),
                    ],
                  ),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
