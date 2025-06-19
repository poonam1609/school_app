import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer_pro/sizer.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final SvgPicture image;


  const DashboardCard({
    Key? key,
    required this.title,
    required this.value,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(1.h),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(1),
        child: Padding(
          padding: EdgeInsets.only(bottom: 3.h,left: 3.w),
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
                        fontSize: 6.sp,
                        color: Color(0xff737373),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      // color: color.withOpacity(0.1),
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
                  color: Color(0xff737373),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}