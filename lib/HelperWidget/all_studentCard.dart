import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer_pro/sizer.dart';
import '../app/modules/edit_student/controllers/edit_student_controller.dart';
import '../app/modules/home/controllers/home_controller.dart';
import '../app/modules/student_info/controllers/student_info_controller.dart';

class StudentCard extends StatelessWidget {
  final String name;
  final String class_standard;
  final String registrationId;
  final String gender;
  final String mobile;
  final String email;
  final void Function()? onDelete;

  const  StudentCard({
    Key? key,
    this.name = "John Doe",
    this.registrationId = "123",
    this.gender = "Male",
    this.mobile = "+91 9876543210",
    this.email = "john.doe@example.com",
    this.onDelete,
    this.class_standard = "1st",

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.w),
      padding: EdgeInsets.symmetric(vertical: 1.h),
      decoration: BoxDecoration(
          color: Colors.white,
        border: Border.all(
          color:
          gender.toLowerCase() == 'male'
              ? Colors.blue
              : gender.toLowerCase() == 'female'
              ? Colors.pink
              : Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(1.5.h),
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
                  'registration_id': registrationId,
                  'gender': gender,
                  'mobile': mobile,
                  'email': email,
                  'class_standard':class_standard,
                };
                controller.selectedModel.value = studentData;
                switch (value) {
                  case 'view':
                    controller.previousNavIndex.value = 201;
                    Get.put(StudentInfoController());
                    controller.selectMenu(206);
                    break;
                  case 'edit':
                    controller.previousNavIndex.value = 201;
                    Get.put(EditStudentController());
                    controller.selectMenu(205);
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
          Row(
            children: [
              SizedBox(width: 4.w,),
              CircleAvatar(
                radius: 4.h,
                backgroundImage:AssetImage("assets/image/offer_image.jpg") ,
                backgroundColor: Colors.blue[100],

              ),
              SizedBox(width: 5.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 6.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 1.h),
                  // Registration ID directly below name
                  Text(
                    registrationId,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 5.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: 0.5.h), // Optional: spacing before next section
                ],
              ),

              // Gender
            ],
          ),
        ],
      ),
    );
  }
}
