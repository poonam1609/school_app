import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:school_app/HelperWidget/customSearch.dart';
import 'package:school_app/HelperWidget/customText.dart';
import 'package:sizer_pro/sizer.dart';

import '../controllers/offer_letter_controller.dart';

class OfferLetterView extends GetView<OfferLetterController> {
  OfferLetterController offerLetterController = Get.put<OfferLetterController>(
    OfferLetterController(),
  );
  OfferLetterView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: offerLetterController,
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 2.h),
                CustomText(
                  text: 'Offer Letter',
                  fontWeight: FontWeight.bold,
                  fontSize: 9.sp,
                ),
                SizedBox(height: 1.h),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 4.w),
                 child: CustomSearchInput(onChanged: (value) {

                 },),
               ),
                SizedBox(height: 2.h),
                Expanded(
                  child: Obx(() {
                    return ListView.builder(
                      itemCount: offerLetterController.employees.length,
                      itemBuilder: (context, index) {
                        final employee = offerLetterController.employees[index];
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                          padding: EdgeInsets.all(2.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2.h),
                   /*         boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 2),
                              ),
                            ],*/
                            border: Border.all(
                              color: employee.isFemale
                                  ? Color(0xffC838BA).withOpacity(0.7)
                                  : Color(0xff1E88E5).withOpacity(0.5),
                              width: 1.6,
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                          ClipOval(
                          child: Image.asset(
                            employee.profilePicture,
                            width: 80,    // same as CircleAvatar diameter
                            height: 80,
                            fit: BoxFit.cover, // Ensures the image fills the circle
                          ),
                          ),

                          /// Icons below profile (no extra space)
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          // View profile action
                                        },
                                        icon: Icon(Icons.person_outline),
                                        color: Colors.black,
                                        iconSize: 9.sp,
                                        padding: EdgeInsets.zero,
                                        constraints: BoxConstraints(), // removes default constraints
                                      ),
                                      IconButton(
                                        onPressed: () => offerLetterController.printOfferLetter(employee),
                                        icon: Icon(Icons.print_outlined),
                                        color: Colors.black,
                                        iconSize: 9.sp,
                                        padding: EdgeInsets.zero,
                                        constraints: BoxConstraints(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(width: 4.w),

                              /// RIGHT SIDE: Text details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      employee.name,
                                      style: TextStyle(fontSize: 8.sp, ),
                                    ),
                                    SizedBox(height: 0.5.h),
                                  CustomText(text: "Employee ID :${employee.employeeId}",color: Colors.grey, fontSize: 5.sp,),
                                    CustomText(text: "Date of Joining :${employee.dateOfJoining}",color: Colors.grey, fontSize: 5.sp ),
                                    CustomText(text: "Username :${employee.username}",color: Colors.grey, fontSize: 5.sp ),
                                    CustomText(text: "Password :${employee.password}",color: Colors.grey, fontSize: 5.sp ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );

                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
