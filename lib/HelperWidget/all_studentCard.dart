import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:school_app/app/modules/teacher_info/controllers/teacher_info_controller.dart';
import 'package:school_app/app/routes/app_pages.dart';
import 'package:sizer_pro/sizer.dart';
import '../app/modules/edit_student/controllers/edit_student_controller.dart';
import '../app/modules/edit_teacher/controllers/edit_teacher_controller.dart';
import '../app/modules/home/controllers/home_controller.dart';
import '../app/modules/student_info/controllers/student_info_controller.dart';

class StudentCard extends StatelessWidget {
  final String name;
  final String class_standard;
  final String registrationId;
  final String gender;
  final String mobile;
  final String email;
  final String experience;
  final String monthlySalary;
  final void Function()? onDelete;

  const StudentCard({
    Key? key,
    this.name = "John Doe",
    this.registrationId = "123",
    this.gender = "Male",
    this.mobile = "+91 9876543210",
    this.email = "john.doe@example.com",
    this.experience = "3 years",
    this.monthlySalary = "50000",
    this.onDelete,
    required this.class_standard,

  }) : super(key: key);

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
                final studentData = {
                  'name': name,
                  'registrationId': registrationId,
                  'gender': gender,
                  'mobile': mobile,
                  'email': email,
                  'experience': experience,
                  'monthlySalary': monthlySalary,
                };
                controller.selectedModel.value = studentData;

                switch (value) {
                  case 'view':
                    controller.previousNavIndex.value = 102;
                    Get.put(StudentInfoController());
                    controller.selectMenu(105);
                    break;
                  case 'edit':
                    controller.previousNavIndex.value = 102;
                    Get.put(EditStudentController());
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
                registrationId,
                style: TextStyle(color: Colors.grey[600], fontSize: 6.sp),
              ),

              // Gender
            ],
          ),
        ],
      ),
    );
  }
 /* Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.h)),
      child: Column(
        children: [
          SizedBox(height: 2.h),
          // Profile Image
          CircleAvatar(
            radius: 3.5.h,
            backgroundColor: Colors.blue[100],
            child: Icon(Icons.person, size: 15.sp, color: Colors.blue),
          ),
          SizedBox(height: 1.h),

          // Name
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            class_standard,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          // Designation
          Text(
            registrationId,
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
            textAlign: TextAlign.center,
          ),

          // Gender
          // Text(
          //   gender,
          //   style: TextStyle(color: Colors.grey[500], fontSize: 12),
          //   textAlign: TextAlign.center,
          // ),

          // Action Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  final controller = Get.find<HomeController>();
                  final studentData = {
                    'name': name,
                    'class_standard':class_standard,
                    'registration_id': registrationId,
                    'gender': gender,
                    'mobile': mobile,
                    'email': email,
                    'experience': experience,
                    'monthlySalary': monthlySalary,
                  };
                  controller.selectedModel.value = studentData;
                  Get.put(StudentInfoController());
                  print(
                    "++++++>>>>>>${controller.selectedModel.value = studentData}",
                  );
                  controller.previousNavIndex.value = 201;
                  controller.selectMenu(206);
                  *//*   // Handle view action
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: Text(name),
                          content: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _buildInfoRow('Role', role),
                                _buildInfoRow('Mobile', mobile),
                                _buildInfoRow('Email', email),
                                _buildInfoRow('Gender', gender),
                                _buildInfoRow('Experience', experience),
                                _buildInfoRow('Salary', '₹$monthlySalary'),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Get.back(),
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                  );*//*
                },
                icon: const Icon(Icons.visibility, color: Colors.blue),
              ),
              IconButton(
                onPressed: () {
                  final controller = Get.find<HomeController>();
                  final studentData = {
                    'name': name,
                    'registration_id': registrationId,
                    'class_standard':class_standard,
                    'gender': gender,
                    'mobile': mobile,

                  };
                  controller.selectedModel.value = studentData;
                  Get.put(EditStudentController());
                  controller.previousNavIndex.value = 201;
                  controller.selectMenu(205);
                },
                icon: const Icon(Icons.edit, color: Colors.orange),
              ),
              IconButton(
                onPressed: () {
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
                            Get.back(); // Close dialog
                            if (onDelete != null) {
                              onDelete!(); // Trigger delete logic
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('$name deleted successfully'),
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
                },
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }*/

}
