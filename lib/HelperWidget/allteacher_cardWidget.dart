import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:school_app/app/modules/teacher_info/controllers/teacher_info_controller.dart';
import 'package:school_app/app/routes/app_pages.dart';
import 'package:sizer_pro/sizer.dart';
import '../app/modules/edit_teacher/controllers/edit_teacher_controller.dart';
import '../app/modules/home/controllers/home_controller.dart';

class EmployeeCard extends StatelessWidget {
  final String name;
  final String role;
  final String gender;
  final String mobile;
  final String email;
  final String experience;
  final String monthlySalary;
  final void Function()? onDelete;

  const EmployeeCard({
    Key? key,
    this.name = "John Doe",
    this.role = "Principal",
    this.gender = "Male",
    this.mobile = "+91 9876543210",
    this.email = "john.doe@example.com",
    this.experience = "3 years",
    this.monthlySalary = "50000",
    this.onDelete,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.w),
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
      decoration: BoxDecoration(
        color:
            gender.toLowerCase() == 'male'
                ? Colors.blue.shade50
                : gender.toLowerCase() == 'female'
                ? Colors.pink.shade50
                : Colors.grey.shade100,
        border: Border.all(
          color:
              gender.toLowerCase() == 'male'
                  ? Colors.blue
                  : gender.toLowerCase() == 'female'
                  ? Colors.pink
                  : Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(0.7.h),
        boxShadow: [
        /*  BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 3,
            offset: Offset(0, 0),
          ),*/
        ],
      ),

      child: Stack(
        children: [
          Positioned(
            top: 1.h,
            left: 1.w,
            child: Icon(
              gender.toLowerCase() == 'male'
                  ? Icons.male
                  : gender.toLowerCase() == 'female'
                  ? Icons.female
                  : Icons.help_outline,
              color:
                  gender.toLowerCase() == 'male'
                      ? Colors.blue
                      : gender.toLowerCase() == 'female'
                      ? Colors.pink
                      : Colors.grey,
              size: 10.sp,
            ),
          ),
          // Popup Menu Positioned at Top Right
          Positioned(
            right: 0,
            top: 0,
            child: PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert),
              onSelected: (String value) {
                final controller = Get.find<HomeController>();
                final teacherData = {
                  'name': name,
                  'role': role,
                  'gender': gender,
                  'mobile': mobile,
                  'email': email,
                  'experience': experience,
                  'monthlySalary': monthlySalary,
                };
                controller.selectedModel.value = teacherData;

                switch (value) {
                  case 'view':
                    controller.previousNavIndex.value = 102;
                    Get.put(TeacherInfoController());
                    controller.selectMenu(105);
                    break;
                  case 'edit':
                    controller.previousNavIndex.value = 102;
                    Get.put(EditTeacherController());
                    controller.selectMenu(104);
                    break;
                  case 'delete':
                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: const Text('Delete Employee'),
                            content: Text(
                              'Are you sure you want to delete $name?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Get.back(),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                  if (onDelete != null) onDelete!();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        '$name deleted successfully',
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                    );
                    break;
                }
              },
              itemBuilder:
                  (BuildContext context) => [
                    const PopupMenuItem(
                      value: 'view',
                      child: Row(
                        children: [
                          Icon(Icons.visibility, color: Colors.blue),
                          SizedBox(width: 10),
                          Text('View'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit_outlined,
                            color: Colors.deepPurpleAccent,
                          ),
                          SizedBox(width: 10),
                          Text('Edit'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete_outline, color: Colors.red),
                          SizedBox(width: 10),
                          Text('Delete'),
                        ],
                      ),
                    ),
                  ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 5.h,
                  backgroundColor: Colors.blue[100],
                  child: Icon(
                    Icons.person,
                    size: 15.sp,
                    color: Colors.blue[300],
                  ),
                ),
              ),
              SizedBox(height: 2.h),

              // Name
              Text(
                name,
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 8.sp,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 0.5.h),

              // Role
              Text(
                role,
                style: TextStyle(color: Colors.grey[600], fontSize: 6.sp),
              ),

              // Gender
            ],
          ),
        ],
      ),
    );
  }

  /*
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }*/
}
