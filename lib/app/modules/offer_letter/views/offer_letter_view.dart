import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
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
                Container(
                  color: Colors.grey.shade200,
                  padding: EdgeInsets.all(2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Employee',
                        style: TextStyle(
                          fontSize: 7.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Offer Letter',
                        style: TextStyle(
                          fontSize: 7.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.h),
                TextField(
                  onChanged: (value) {
                    // controller.searchQuery.value = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Search employees...',
                    prefixIcon: const Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                Expanded(
                  child: Obx(() {
                      return ListView.builder(
                        itemCount: offerLetterController.employees.length,
                        itemBuilder: (context, index) {
                          final employee = offerLetterController.employees[index];
                          return Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 4.w,
                              vertical: 1.h,
                            ),
                            padding: EdgeInsets.all(3.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2.h),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width:3.w),
                                    Container(
                                      width: 30.w,
                                      height: 30.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey[300],
                                      ),
                                      child: ClipOval(

                                        child: SvgPicture.asset(
                                          height: 15.h,
                                          employee.profilePicture, // should be .svg path
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                       InkWell(
                            onTap:
                                () => offerLetterController
                                .printOfferLetter(employee),
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              padding: EdgeInsets.all(2.w),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.print,
                                color: Colors.blue[700],
                                size: 5.w,
                              ),
                            ),
                                       ),
                                  ],
                                ),
                                Text(
                                  employee.name,
                                  style: TextStyle(
                                    fontSize: 7.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 0.5.h),
                                _buildDetailRow(
                                  'Employee ID',
                                  employee.employeeId,
                                ),
                                _buildDetailRow(
                                  'Join Date',
                                  employee.dateOfJoining,
                                ),
                                _buildDetailRow(
                                  'Username',
                                  employee.username,
                                ),
                                _buildDetailRow(
                                  'Password',
                                  employee.password,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Status: ',
                                      style: TextStyle(
                                        fontSize: 6.sp,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 3.w,

                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                        employee.accountStatus ==
                                            'Active'
                                            ? Colors.green.withOpacity(
                                          0.1,
                                        )
                                            : Colors.red.withOpacity(
                                          0.1,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          12,
                                        ),
                                        border: Border.all(
                                          color:
                                          employee.accountStatus ==
                                              'Active'
                                              ? Colors.green
                                              : Colors.red,
                                          width: 1,
                                        ),
                                      ),
                                      child: Text(
                                        employee.accountStatus,
                                        style: TextStyle(
                                          fontSize: 7.sp,
                                          color:
                                          employee.accountStatus ==
                                              'Active'
                                              ? Colors.green[700]
                                              : Colors.red[700],
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),

                            // Print Icon

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

Widget _buildDetailRow(String label, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '$label: ',
        style: TextStyle(
          fontSize: 6.sp,
          color: Colors.grey[600],
          fontWeight: FontWeight.w500,
        ),
      ),
      Text(
        value,
        style: TextStyle(
          fontSize: 6.sp,
          color: Colors.black87,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}
