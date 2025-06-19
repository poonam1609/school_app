import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer_pro/sizer.dart';
import '../app/modules/onboarding/controllers/onboarding_controller.dart';

class OnboardingPageItem extends StatelessWidget {
  final OnboardingData data;
  const OnboardingPageItem({
    super.key,
    required this.data,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: 7.h,),
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: SvgPicture.asset(
                data.imagePath,
                fit: BoxFit.contain,
                // color:  Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              data.title,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 1.h),
            Text(
              data.description,
              style: TextStyle(
                fontSize: 6.sp,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
