import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer_pro/sizer.dart';
import '../app/appTheme/customColor.dart';
import '../app/modules/onboarding/controllers/onboarding_controller.dart';

class OnboardingPageItem extends StatelessWidget {
  final OnboardingData data;
  const OnboardingPageItem({
    super.key,
    required this.data,
  });
  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: 7.h,),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: SvgPicture.asset(  color: Theme.of(context).brightness == Brightness.dark
                  ? Color(0xffEBD3F8)
                  : null,
                data.imagePath,
                fit: BoxFit.contain,
                // color:  Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              data.title,
              style: TextStyle(
                fontSize: 10.6.sp,
                fontWeight: FontWeight.w600,
                color:  customColors.primaryTextColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 2.h),
            Text(
              data.description,
              style: TextStyle(
                fontSize: 5.3.sp,
                color: customColors.secondaryTextColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
