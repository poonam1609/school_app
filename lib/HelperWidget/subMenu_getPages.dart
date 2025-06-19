import 'package:flutter/cupertino.dart';
import 'package:school_app/app/modules/add_student/views/add_student_view.dart';
import 'package:school_app/app/modules/add_teacher/views/add_teacher_view.dart';
import 'package:school_app/app/modules/all_student/views/all_student_view.dart';
import 'package:school_app/app/modules/all_teacher/views/all_teacher_view.dart';
import 'package:school_app/app/modules/edit_student/views/edit_student_view.dart';
import 'package:school_app/app/modules/edit_teacher/views/edit_teacher_view.dart';
import 'package:school_app/app/modules/home/views/home_view.dart';
import 'package:school_app/app/modules/offer_letter/views/offer_letter_view.dart';
import 'package:school_app/app/modules/promote_student/views/promote_student_view.dart';
import 'package:school_app/app/modules/student_idCard/views/student_id_card_view.dart';
import 'package:school_app/app/modules/student_info/views/student_info_view.dart';
import 'package:school_app/app/modules/teacher_info/views/teacher_info_view.dart';

final Map<int, Widget> pageMap = {
  0: HomeView(),
  101: AddTeacherView(),
  102: AllTeacherView(),
  103: OfferLetterView(),
  104: EditTeacherView(),
  105:TeacherInfoView(),
  201:AllStudentView(),
  202:AddStudentView(),
  203:PromoteStudentView(),
  204:StudentIdCardView(),
  205: EditStudentView(),
  206:StudentInfoView(),




};
