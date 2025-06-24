import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/HelperWidget/customText.dart';
import 'package:sizer_pro/sizer.dart';
import '../controllers/all_classes_controller.dart';

class AllClassesView extends StatelessWidget {
  final AllClassesController controller = Get.put(AllClassesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle:true,
          title: CustomText(text: 'All Classes', fontWeight: FontWeight.bold,
            fontSize: 8.sp,),
      ),
      backgroundColor: Color(0xffF5F6FA),
      body: Obx(() => ListView.builder(
        padding: EdgeInsets.all(4.w),
        itemCount: controller.classList.length,
        itemBuilder: (context, index) {
          final data = controller.classList[index];
          final boysPercentage =
          (data.boys / data.totalStudents * 100).toDouble();
          final girlsPercentage =
          (data.girls / data.totalStudents * 100).toDouble();
          return Padding(
            padding:  EdgeInsets.symmetric(vertical: 1.h),
            child: Container(
              padding: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(1.5.h),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ],
              ),
              child: Padding(
                padding:  EdgeInsets.all(2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// Top Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.className,
                          style: TextStyle(color: Colors.grey.shade600,
                              fontSize: 5.5.sp, fontWeight: FontWeight.w700),
                        ),
                        Row(
                          children: [
                            Icon(Icons.edit_outlined, size: 8.sp,color: Colors.grey.shade600,),
                            SizedBox(width: 2.w),
                            Icon(Icons.delete_outline, size: 7.sp,color: Colors.grey.shade600),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 0.5.h),
                    /// Total Students
                    RichText(
                      text: TextSpan(
                        text: 'Total Students: ',
                        style:
                        TextStyle(color: Colors.blue, fontSize: 7.sp,fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: '${data.totalStudents}',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 7.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.7.h),
                    /// Boy & Girl Stats
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildStudentStat(
                          percentage: boysPercentage,
                          imagePath: 'assets/image/boy_img.png',
                          label: 'Boys',
                          count: data.boys,
                          progressColor: Colors.blue,
                          gender: 'male',
                        ),
                        buildStudentStat(
                          percentage: girlsPercentage,
                          imagePath: 'assets/image/girl_img.png',
                          label: 'Girls',
                          count: data.girls,
                          progressColor: Colors.pinkAccent,
                          gender: 'Female',
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      )),
    );
  }
  Widget buildStudentStat({
    required double percentage,
    required String imagePath,
    required String label,
    required int count,
    required Color progressColor,
    required String gender,
  }) {
    final Color arcColor = gender.toLowerCase() == 'male'
        ? Colors.blue
        : Colors.pinkAccent;
    final Color innerColor = arcColor.withOpacity(0.2);
    return Column(
      children: [
      Stack(
      alignment: Alignment.center,
      children: [
        // Outer dark arc (percentage)
        SizedBox(
          width: 26.w,
          height: 26.w,
          child: CircularProgressIndicator(
            value: percentage / 100,
            strokeWidth: 8,
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation(arcColor),
          ),
        ),
        SizedBox(
          width: 22.w,
          height: 22.w,
          child: CircularProgressIndicator(
            value: 1.0,
            strokeWidth: 6,
            valueColor: AlwaysStoppedAnimation(innerColor.withOpacity(0.2)),
          ),
        ),
        ClipOval(
          child: Image.asset(
            imagePath,
            width: 20.w,    // Same diameter as the circle
            height: 20.w,
            fit: BoxFit.contain,
          ),
        ),
      ],
    ),
    SizedBox(height: 3.h),
    Text(
    "${percentage.toStringAsFixed(0)}%",
    style: TextStyle(
    fontWeight: FontWeight.bold, fontSize: 8.sp, color: Colors.grey.shade700 ,),
    ),
        Text(
          "$label: $count",
          style: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.bold, color: Colors.grey.shade700),
        ),
      ],
    );
  }
}
