import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../HelperWidget/custome_dropDown.dart';
import '../../../appTheme/customColor.dart';
import '../controllers/time_table_controller.dart';

class TimeTableView extends GetView<TimeTableController> {
  TimeTableController timeTableController = Get.put(TimeTableController());
  TimeTableView({super.key});
  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => Padding(
            padding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 3.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Add New Timetable",
                    style: TextStyle(fontSize: 7.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  "Select Class",
                  style: TextStyle(fontSize: 5.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 1.h),
                Obx(() => CustomDropdown(
                  value: timeTableController.selectedClass.value,
                  items: timeTableController.classList,
                  onChanged: (value) => timeTableController.selectedClass.value =
                      value ?? 'Select Subject',
                )),
                SizedBox(height: 2.h),
                SizedBox(
                  width: double.infinity,
                  height: 6.h,
                  child: ElevatedButton(
                    onPressed: controller.submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.h),
                      ),
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 6.sp, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Icon(Icons.attachment_sharp, color: Colors.grey),
                    SizedBox(width: 2.w),
                    Text(
                      "Add attachment",
                      style: TextStyle(
                        fontSize: 5.5.sp,
                        color: customColors?.primaryTextColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent",
                      style: TextStyle(
                        fontSize: 6.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: controller.refresh,
                      icon: Icon(Icons.refresh, size: 6.sp),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.timetables.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.w,
                    mainAxisSpacing: 2.h,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (_, index) {
                    final item = controller.timetables[index];
                    return Container(
                      decoration: BoxDecoration(
                        color:customColors?.containerBackgroundColor,
                        borderRadius: BorderRadius.circular(2.w),
                        border: Border.all(color: Colors.blue),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(0.5.h),
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 3.w,
                                  vertical: 0.2.h,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  border: Border.all(color: Colors.blue),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(1.w),
                                    topRight: Radius.circular(1.w),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Label Text
                                    Text(
                                      item['label'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 6.sp,
                                        color: Colors.grey.shade800,
                                      ),
                                    ),

                                    // Icons
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.edit,
                                          size: 5.5.sp,
                                          color: Colors.black,
                                        ),
                                        SizedBox(width: 2.w),
                                        Icon(
                                          Icons.delete,
                                          size: 5.5.sp,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(0.6.h),
                              child: Container(
                                height: 15.h, // or any fixed value
                                width: double.infinity,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(1.w),
                                  border: Border.all(color: Colors.blue),
                                ),
                                child: Image.asset(
                                  item['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
