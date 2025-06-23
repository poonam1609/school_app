import 'package:get/get.dart';
import 'package:school_app/HelperWidget/customButton.dart';
import 'package:sizer_pro/sizer.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../../../HelperWidget/customText.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/teacher_info_controller.dart';

class TeacherInfoView extends GetView<TeacherInfoController> {
  const TeacherInfoView({super.key});
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final controller = Get.find<TeacherInfoController>();
    return WillPopScope(
      onWillPop: () async {
        if (homeController.previousNavIndex.value != homeController.selectedNavIndex.value) {
          homeController.goBackToPrevious(); // ← go back to AllTeachers
          return false; // Prevent default back navigation
        }
        return true;
      },
      child: Scaffold(
           body: SingleChildScrollView(
             child: SafeArea(child: Column(
               children: [
                 SizedBox(height: 2.h,),
                 CustomText(text: "Employee Information",fontWeight: FontWeight.bold,fontSize: 9.sp),
                 SizedBox(height: 3.h,),
                 Container(
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     border: Border.all(color: Colors.transparent, width: 4),

                   ),
                   child: Obx(() {
                     if (controller.profileImage.value != null) {
                       return CircleAvatar(
                         radius: 40,
                         backgroundImage: FileImage(controller.profileImage.value!),
                       );
                     } else {
                       return CircleAvatar(
                         radius: 40,
                         backgroundColor: Colors.grey[300],
                         child: Icon(Icons.person, size: 40, color: Colors.white),
                       );
                     }
                   }
                   ),
                 ),
                 SizedBox(height: 2.h),
                 Text(
                   controller.employeeName.value,
                   style: TextStyle(
                     fontSize: 8.sp,
                     fontWeight: FontWeight.bold,
                     color: Colors.black,
                   ),
                 ),
                 SizedBox(height:1.h),
                 // Role and Status
                 Text(
                   controller.role.value,
                   style:
                   TextStyle(
                     fontSize: 6.sp,
                     color: Colors.black,
                     fontWeight: FontWeight.w500,
                   ),
                 ),

                 Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: Column(
                     children: [
                       // Professional Information
                       _buildInfoCard(context,'Professional Information', [
                         _buildInfoItem(context,Icons.work_outline_sharp, 'Role', controller.role.value),
                         _buildInfoItem(context,Icons.schedule_outlined, 'Experience', controller.experience.value),
                         _buildInfoItem(context,Icons.date_range_outlined, 'Date of Joining', _formatDate(controller.dateOfJoining.value)),
                         _buildInfoItem(context,Icons.circle, 'Status', controller.status.value),
                       ]),
                       const SizedBox(height: 16),
                       // Contact Information
                       _buildInfoCard(context,'Contact Information', [
                         _buildInfoItem(context,Icons.phone_outlined, 'Mobile', controller.mobileNumber.value),
                         _buildInfoItem(context,Icons.email_outlined, 'Email', controller.emailAddress.value),
                         _buildInfoItem(context,Icons.home_outlined, 'Address', controller.address.value),
                       ]),
                       const SizedBox(height: 16),

                       // Personal Information
                       _buildInfoCard(context,'Personal Information', [
                         _buildInfoItem(context,Icons.cake_outlined, 'Date of Birth', _formatDate(controller.dateOfBirth.value)),
                         _buildInfoItem(context,Icons.person_outline, 'Gender', controller.gender.value),
                         _buildInfoItem(context,Icons.bloodtype_outlined, 'Blood Group', controller.bloodGroup.value),
                         _buildInfoItem(context,Icons.account_balance_outlined, 'Religion', controller.religion.value),
                         _buildInfoItem(context,Icons.family_restroom_outlined, 'Father Name', controller.fatherName.value),
                       ]),
                       const SizedBox(height: 16),

                       // Education & Documents
                       _buildInfoCard(context,'Education & Documents', [
                         _buildInfoItem(context,Icons.school_outlined, 'Education', controller.education.value),
                         _buildInfoItem(context,Icons.credit_card_outlined, 'Aadhar Number', _maskAadhar(controller.adhar.value)),
                       ]),
                       const SizedBox(height: 16),

                       // Account Information
                       _buildInfoCard(context,'Account Information', [
                         _buildInfoItem(context,Icons.person_outlined, 'Username', controller.username.value),
                         _buildInfoItem(context,Icons.lock_outlined, 'Password', controller.password.value),
                       ]),
                       const SizedBox(height: 16),

                       // Salary Information
                       _buildInfoCard(context,'Salary Information', [
                         _buildInfoItem(context,Icons.attach_money_outlined, 'Monthly Salary', "₹${controller.monthlySalary.value}"),
                       ]),
                       const SizedBox(height: 30),

                       // Print Button
                       SizedBox(
                         width: double.infinity,
                         height: 50,
                         child: PrimaryButton(
                           color: Theme.of(context).primaryColor,
                             text: 'Print',
                             onPressed: _generateAndPrintPDF,
                         ),
                       ),
                     ],
                   ),
                 ),
               ],
             )),
           ),
      ),
    );
  }
  Widget _buildInfoCard(BuildContext context,String title, List<Widget> children) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Divider(color: Theme.of(context).primaryColor,),
            const SizedBox(height: 10),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(BuildContext context,IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color:Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 110,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),

          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(String date) {
    try {
      DateTime parsedDate = DateTime.parse(date);
      return '${parsedDate.day}/${parsedDate.month}/${parsedDate.year}';
    } catch (e) {
      return date; // Return original if parsing fails
    }
  }

  String _maskAadhar(String aadhar) {
    if (aadhar.length >= 8) {
      return '****-****-${aadhar.substring(aadhar.length - 4)}';
    }
    return aadhar;
  }

  Future<void> _generateAndPrintPDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return [
            // Header
            pw.Container(
              width: double.infinity,
              padding: const pw.EdgeInsets.all(20),
              decoration: pw.BoxDecoration(
                color: PdfColors.blue,
                borderRadius: pw.BorderRadius.circular(10),
              ),
              child: pw.Column(
                children: [
                  pw.Text(
                    'EMPLOYEE PROFILE',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.white,
                    ),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Text(
                    controller.employeeName.value,
                    style: pw.TextStyle(
                      fontSize: 20,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.white,
                    ),
                  ),
                  pw.Text(
                    "${controller.role.value} - ${controller.status}",
                    style: pw.TextStyle(
                      fontSize: 16,
                      color: PdfColors.white,
                    ),
                  ),
                ],
              ),
            ),
            pw.SizedBox(height: 30),

            // Professional Information
            _buildPDFSection('Professional Information', [
              ['Role', controller.role.value],
              ['Experience', controller.experience.value],
              ['Date of Joining', _formatDate(controller.dateOfJoining.value)],
              ['Status', controller.status.value],
            ]),
            pw.SizedBox(height: 20),

            // Contact Information
            _buildPDFSection('Contact Information', [
              ['Mobile', controller.mobileNumber.value],
              ['Email', controller.emailAddress.value],
              ['Address', controller.address.value],
            ]),
            pw.SizedBox(height: 20),

            // Personal Information
            _buildPDFSection('Personal Information', [
              ['Date of Birth', _formatDate(controller.dateOfBirth.value)],
              ['Gender', controller.gender.value],
              ['Blood Group', controller.bloodGroup.value],
              ['Religion', controller.religion.value],
              ['Father Name', controller.fatherName.value],
            ]),
            pw.SizedBox(height: 20),

            // Education & Documents
            _buildPDFSection('Education & Documents', [
              ['Education', controller.education.value],
              ['Aadhar Number', _maskAadhar(controller.adhar.value)],
            ]),
            pw.SizedBox(height: 20),

            // Account Information
            _buildPDFSection('Account Information', [
              ['Username', controller.username.value],
              ['Password', controller.password.value],
            ]),
            pw.SizedBox(height: 20),

            // Salary Information
            _buildPDFSection('Salary Information', [
              ['Monthly Salary', "₹${controller.monthlySalary}"],
            ]),
            pw.Spacer(),
            // Footer
            pw.Container(
              width: double.infinity,
              padding: const pw.EdgeInsets.all(10),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.grey),
              ),
              child: pw.Text(
                'Generated on: ${DateTime.now().toString().split('.')[0]}',
                style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey),
                textAlign: pw.TextAlign.center,
              ),
            ),
          ];
        },
      ),
    );
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  pw.Widget _buildPDFSection(String title, List<List<String>> items) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          title,
          style: pw.TextStyle(
            fontSize: 16,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blue,
          ),
        ),
        pw.SizedBox(height: 10),
        pw.Container(
          padding: const pw.EdgeInsets.all(15),
          decoration: pw.BoxDecoration(
            border: pw.Border.all(color: PdfColors.grey300),
            borderRadius: pw.BorderRadius.circular(5),
          ),
          child: pw.Column(
            children: items.map((item) =>
                pw.Container(
                  margin: const pw.EdgeInsets.symmetric(vertical: 5),
                  child: pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.SizedBox(
                        width: 130,
                        child: pw.Text(
                          '${item[0]}:',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Text(
                          item[1],
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ),
            ).toList(),
          ),
        ),
      ],
    );
  }
}
