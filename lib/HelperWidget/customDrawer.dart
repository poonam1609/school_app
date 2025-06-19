
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/app/modules/home/controllers/home_controller.dart';
import 'package:sizer_pro/sizer.dart';
import '../models/drawerModel.dart';
import 'drawerTile.dart';

class CustomDrawer extends StatelessWidget {
  final HomeController controller = Get.find();

  final Map<String, List<DrawerSection>> groupedSections = {
    'Dashboard': [
      DrawerSection(title: 'Home', icon: Icons.home_outlined, index: 0),
    ],
    'Academics': [
      DrawerSection(title: 'Teachers', icon: Icons.school_outlined, index: 1,
        subItems: [
        DrawerSubItem(title: 'Add Teacher', index: 101, icon: Icons.person_add,onTap:() {
          Get.back();
        },),
        DrawerSubItem(title: 'All Teachers', index: 102, icon: Icons.people),
        DrawerSubItem(title: 'Offer Letter', index: 103, icon: Icons.mail_outline),
      ],),
      DrawerSection(title: 'Students', icon: Icons.groups_outlined, index: 2,  subItems: [
        DrawerSubItem(title: 'All Students', index: 201, icon: Icons.list),
        DrawerSubItem(title: 'Add Students', index: 202, icon: Icons.person_add_alt_1),
        DrawerSubItem(title: 'Promote Students', index: 203, icon: Icons.trending_up),
        DrawerSubItem(title: 'Student ID Cards', index: 204, icon: Icons.badge),
      ],),
      DrawerSection(title: 'Classes', icon: Icons.class_outlined, index: 3, subItems: [
        DrawerSubItem(title: 'All Classes', index: 301, icon: Icons.view_list),
        DrawerSubItem(title: 'New Classes', index: 302, icon: Icons.add_box),
      ],),
      DrawerSection(title: 'Homework', icon: Icons.assignment_turned_in_outlined, index: 4),
      DrawerSection(title: 'Time Table', icon: Icons.schedule, index: 5),
      DrawerSection(title: 'Subjects', icon: Icons.menu_book_outlined, index: 6,subItems: [
        DrawerSubItem(title: 'Subject With Class', index: 601, icon: Icons.bookmark),
        DrawerSubItem(title: 'Create Subject', index: 602, icon: Icons.add_circle_outline),
      ],),
      DrawerSection(title: 'Certificates', icon: Icons.workspace_premium_outlined, index: 7,subItems: [
        DrawerSubItem(title: 'Bonafied Certificate', index: 701, icon: Icons.school_outlined),
        DrawerSubItem(title: 'Leaving Certificate', index: 702, icon: Icons.exit_to_app),
        DrawerSubItem(title: 'Character Certificate', index: 703, icon: Icons.recent_actors),
      ],),
    ],
    'Daily Operation': [
      DrawerSection(title: 'Attendance', icon: Icons.fact_check_outlined, index: 8,  subItems: [
        DrawerSubItem(title: 'Mark Student Attendance', index: 801, icon: Icons.check_circle_outline),
        DrawerSubItem(title: 'Mark Teacher Attendance', index: 802, icon: Icons.verified_user),
      ],),
      DrawerSection(title: 'Messages', icon: Icons.chat_bubble_outline, index: 9),
      DrawerSection(title: 'Gallery', icon: Icons.photo_album_outlined, index: 10,   subItems: [
        DrawerSubItem(title: 'Create Gallery', index: 1001, icon: Icons.create),
        DrawerSubItem(title: 'View Gallery', index: 1002, icon: Icons.photo_library),
      ],),
    ],
    'Finance & Administration': [
      DrawerSection(title: 'Fees', icon: Icons.currency_rupee, index: 11, subItems: [
        DrawerSubItem(title: 'Collection Fee', index: 1101, icon: Icons.receipt_long),
        DrawerSubItem(title: 'Fee Slip', index: 1102, icon: Icons.description),
        DrawerSubItem(title: 'Fee Defaulter', index: 1103, icon: Icons.warning_amber),
        DrawerSubItem(title: 'Fee Class Status', index: 1104, icon: Icons.analytics),
      ],),
      DrawerSection(title: 'Salary', icon: Icons.payments_outlined, index: 12,subItems: [
        DrawerSubItem(title: 'Pay Salary', index: 1201, icon: Icons.credit_score),
        DrawerSubItem(title: 'Salary Slip', index: 1202, icon: Icons.description_outlined),
      ],),
      DrawerSection(title: 'Bank Account', icon: Icons.account_balance_outlined, index: 13,  subItems: [
        DrawerSubItem(title: 'Account Head', index: 1301, icon: Icons.account_tree),
        DrawerSubItem(title: 'Add Income', index: 1302, icon: Icons.trending_up),
        DrawerSubItem(title: 'Add Expense', index: 1303, icon: Icons.trending_down),
        DrawerSubItem(title: 'Account Statement', index: 1304, icon: Icons.list_alt),
      ],),
    ],
    'Reports & Enquiries': [
      DrawerSection(title: 'Reports', icon: Icons.bar_chart_outlined, index: 14,  subItems: [
        DrawerSubItem(title: 'Student Attendance Report', index: 1401, icon: Icons.assignment_ind),
        DrawerSubItem(title: 'Teacher Attendance Report', index: 1402, icon: Icons.assignment),
        DrawerSubItem(title: 'Fees Class Report', index: 1403, icon: Icons.stacked_bar_chart),
        DrawerSubItem(title: 'Fees Students Report', index: 1404, icon: Icons.receipt),
      ],),
      DrawerSection(title: 'Enquiry', icon: Icons.contact_support_outlined, index: 15,  subItems: [
        DrawerSubItem(title: 'Create Inquiry', index: 1501, icon: Icons.edit_note),
        DrawerSubItem(title: 'View Inquiry', index: 1502, icon: Icons.remove_red_eye),
      ],),
    ],
    'Vehicle Tracking': [
      DrawerSection(title: 'Vehicle Tracking', icon: Icons.location_on_outlined, index: 16, subItems: [
        DrawerSubItem(title: 'All Driver', index: 1601, icon: Icons.directions_bus),
        DrawerSubItem(title: 'Add Driver', index: 1602, icon: Icons.person_add_alt),
        DrawerSubItem(title: 'Bus Tracking', index: 1603, icon: Icons.route),
      ],),
    ],
    'Settings': [
      DrawerSection(title: 'Settings', icon: Icons.settings_outlined, index: 17, subItems: [
        DrawerSubItem(title: 'Institute Profile', index: 1701, icon: Icons.account_circle),
        DrawerSubItem(title: 'Fee Particular', index: 1702, icon: Icons.list_alt),
        DrawerSubItem(title: 'Account Settings', index: 1703, icon: Icons.settings_applications),
        DrawerSubItem(title: 'Add Event', index: 1704, icon: Icons.event),
      ],),
    ],
  };
  Widget drawerHeader(String title) {
    return Container(
      color: const Color(0xffe6f0ff),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 6.5.sp,

          color: Colors.blueGrey,
        ),textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xffA6A6A6)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.school, size: 35, color: Colors.blue),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'School Management',
                    style: TextStyle(
                      color: const Color(0xff363939),
                      fontSize: 6.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 1.h),
                ],
              ),
            ),
            for (var entry in groupedSections.entries) ...[
              drawerHeader(entry.key),
              ...entry.value.map((section) => DrawerItemTile(section: section, controller: controller)),
            ],
          ],
        ),
      ),
    );
  }
}
