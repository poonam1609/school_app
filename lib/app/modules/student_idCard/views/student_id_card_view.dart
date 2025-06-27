import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../HelperWidget/customText.dart';
import '../../../appTheme/customColor.dart';
import '../controllers/student_id_card_controller.dart';

class StudentIdCardView extends GetView<StudentIdCardController> {
  StudentIdCardController studentIdCardController = Get.put(
    StudentIdCardController(),
  );
  StudentIdCardView({super.key});
  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return GetBuilder(
      init: studentIdCardController,
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle:true,
            title: CustomText(text: 'Student ID Card', fontWeight: FontWeight.bold,
              fontSize: 8.sp,),
          ),
          body: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            itemCount: studentIdCardController.student.length,
            itemBuilder: (context, index) {
              final student = studentIdCardController.student[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 9.h),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(1.h),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.blue, // Blue outer container
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Text("MERIDIAN INTERNATIONAL",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),),
                        SizedBox(height: 1.h,),
                        Container(
                          color:customColors?.containerBackgroundColor,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 4.h,),
                              Container(
                                width: double.maxFinite,
                                color: Colors.grey[300],
                                padding: EdgeInsets.symmetric(vertical: 1.h),
                                child: Center(
                                  child: Text(
                                    'IDENTITY CARD',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 1.h,),
                              Text(
                                'Batch 2025-26',
                                style: TextStyle(
                                  fontSize: 5.7.sp,
                                  color: customColors!.primaryTextColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 2.h,),
                              CircleAvatar(
                                radius: 45,
                                backgroundColor: Colors.blue.shade100,
                                backgroundImage: AssetImage(
                                  'assets/image/id_card_image.png',
                                ),
                              ),
                              SizedBox(height: 2.h,),
                              Text(
                                student['name'] ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 2.h,),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 2.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    detailLine('Grade :', student['class_standard'] ?? '',context),
                                    detailLine('DoB   :', 'Jan 21, 2000',context),
                                    detailLine('Contact No. :', student['mobile'] ?? '',context),
                                    detailLine(
                                      'Add.:',
                                      'Shanti Nagar, New Palasia,\nIndore (M.P.) - 462010',context,
                                    ),
                                  ],
                                ),

                              ),
                              SizedBox(height: 2.h,),
                            ],
                          ),
                        ),

                        Container(
                          color: Color(0xFF2196F3),
                          width: double.infinity,
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Add.: XYZ Nagar,Meridian international school,Indore (M.P.)-460001\nContact number: 7854254521 & 6256545625',
                            style: TextStyle(color: Colors.white, fontSize: 5.sp),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )
                  ),
                ),
              );


            },
          ),
        );
      },
    );
  }
}
Widget detailLine(String label, String value,BuildContext context) {
  final customColors = Theme.of(context).extension<CustomColors>();
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: RichText(
      text: TextSpan(
        style: TextStyle(color: customColors!.primaryTextColor, fontSize: 5.6.sp),
        children: [
          TextSpan(
            text: '$label ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: value),
        ],
      ),
    ),
  );
}
/*Center(
child: Container(
width: 80.w,
decoration: BoxDecoration(
color: Colors.blue,
border: Border.all(color: Colors.black12),
borderRadius: BorderRadius.circular(2.h),
),
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
// Top blue bar
ClipRRect(
borderRadius: BorderRadius.only(
topLeft: Radius.circular(12),
topRight: Radius.circular(12),
),
child: Container(
width: double.infinity,
color: Color(0xFF2196F3),
padding: EdgeInsets.symmetric(vertical: 2.h),
child: Center(
child: Text(
'MERIDIAN INTERNATIONAL',
style: TextStyle(
color: Colors.white,
fontWeight: FontWeight.bold,
fontSize: 16,
),
),
),
),
),
SizedBox(height: 3.h),
// Gray Bar
Container(
width: double.maxFinite,
color: Colors.grey[300],
padding: EdgeInsets.symmetric(vertical: 1.h),
child: Center(
child: Text(
'IDENTITY CARD',
style: TextStyle(
fontWeight: FontWeight.bold,
fontSize: 14,
color: Colors.black87,
),
),
),
),

SizedBox(height: 4),
Text(
'Batch 2025-26',
style: TextStyle(
fontSize: 5.7.sp,
color: Colors.grey[700],
fontWeight: FontWeight.bold,
),
),
SizedBox(height: 12),

// Profile Image
CircleAvatar(
radius: 45,
backgroundColor: Colors.blue.shade100,
backgroundImage: AssetImage(
'assets/image/id_card_image.png',
), // replace with your asset
),
SizedBox(height: 12),
// Name
Text(
student['name'] ?? '',
style: TextStyle(
fontWeight: FontWeight.bold,
fontSize: 16,
),
),
SizedBox(height: 10),

// Details
Padding(
padding: const EdgeInsets.symmetric(horizontal: 20.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
detailLine('Grade :', student['class_standard'] ?? ''),
detailLine('DoB   :', 'Jan 21, 2000'),
detailLine('Contact No. :', student['mobile'] ?? ''),
detailLine(
'Add.:',
'Shanti Nagar, New Palasia,\nIndore (M.P.) - 462010',
),
],
),
),
SizedBox(height: 2.h),

// Bottom blue bar
ClipRRect(
borderRadius: BorderRadius.only(
bottomLeft: Radius.circular(12),
bottomRight: Radius.circular(12),
),
child: Container(
color: Color(0xFF2196F3),
width: double.infinity,
padding: EdgeInsets.all(8),
child: Text(
'Add.: XYZ Nagar,Meridian international school,Indore (M.P.)-460001\nContact number: 7854254521 & 6256545625',
style: TextStyle(color: Colors.white, fontSize: 5.sp),
textAlign: TextAlign.center,
),
),
),
],
),
),
);*/

