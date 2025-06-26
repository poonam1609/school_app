import 'package:flutter/material.dart';

import 'package:sizer_pro/sizer.dart';

class HomeworkCard extends StatelessWidget {
  final String className;
  final String date;
  final String notes;
  final String subject;

  const HomeworkCard({
    super.key,
    required this.className,
    required this.date,
    required this.notes,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2.w),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1)),
        ],
      ),
      child: IntrinsicHeight(
        // ⬅️ ensures both columns are same height
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _tagBox(className),
                  SizedBox(height: 1.h),
                  _tagBox(date),
                  SizedBox(height: 1.h),
                  Text("Subject: $subject", style: TextStyle(fontSize: 4.sp)),
                  Text("Sent by: Admin", style: TextStyle(fontSize: 4.sp)),
                  Text("Additional: N/A", style: TextStyle(fontSize: 4.sp)),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Notes box
                  Expanded(
                    child: Container(
                      // height: 20.h,
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(3.w),
                            topRight: Radius.circular(3.w),
                            bottomRight:  Radius.circular(3.w)
                        ),
                      ),
                      child: Text(
                        notes,
                        style: TextStyle(fontSize: 5.sp, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit, size: 6.sp),
                      SizedBox(height: 2.h),
                      Icon(Icons.attach_file, size: 6.sp),
                      SizedBox(height: 2.h),
                      Icon(Icons.delete, size: 6.sp),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _tagBox(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.3.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(3.w),
          topRight: Radius.circular(3.w),
          bottomRight:  Radius.circular(3.w)
        ),
        border: Border.all(color: Colors.blue),
      ),
      child: Text(text, style: TextStyle(color: Colors.blue, fontSize: 4.5.sp)),
    );
  }
}
