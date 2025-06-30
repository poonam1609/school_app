import 'package:flutter/cupertino.dart';
import 'package:school_app/app/modules/add_student/views/add_student_view.dart';
import 'package:school_app/app/modules/add_teacher/views/add_teacher_view.dart';
import 'package:school_app/app/modules/all_classes/views/all_classes_view.dart';
import 'package:school_app/app/modules/all_student/views/all_student_view.dart';
import 'package:school_app/app/modules/all_teacher/views/all_teacher_view.dart';
import 'package:school_app/app/modules/bonafied_certificate/views/bonafied_certificate_view.dart';
import 'package:school_app/app/modules/character_certificate/views/character_certificate_view.dart';
import 'package:school_app/app/modules/create_subject/views/create_subject_view.dart';
import 'package:school_app/app/modules/edit_student/views/edit_student_view.dart';
import 'package:school_app/app/modules/edit_teacher/views/edit_teacher_view.dart';
import 'package:school_app/app/modules/home/views/home_view.dart';
import 'package:school_app/app/modules/home_work/views/home_work_view.dart';
import 'package:school_app/app/modules/messages/views/messages_view.dart';
import 'package:school_app/app/modules/new_classes/views/new_classes_view.dart';
import 'package:school_app/app/modules/offer_letter/views/offer_letter_view.dart';
import 'package:school_app/app/modules/promote_student/views/promote_student_view.dart';
import 'package:school_app/app/modules/relieving_certificate/views/relieving_certificate_view.dart';
import 'package:school_app/app/modules/student_attendence/views/student_attendence_view.dart';
import 'package:school_app/app/modules/student_idCard/views/student_id_card_view.dart';
import 'package:school_app/app/modules/student_info/views/student_info_view.dart';
import 'package:school_app/app/modules/subject_with_class/views/subject_with_class_view.dart';
import 'package:school_app/app/modules/teacher_attendence/views/teacher_attendence_view.dart';
import 'package:school_app/app/modules/teacher_info/views/teacher_info_view.dart';
import 'package:school_app/app/modules/time_table/views/time_table_view.dart';
import 'package:school_app/app/modules/transfer_certificate/views/transfer_certificate_view.dart';

final Map<int, Widget> pageMap = {
  0: HomeView(),
  101: AddTeacherView(),
  102: AllTeacherView(),
  103: OfferLetterView(),
  104: EditTeacherView(),
  105: TeacherInfoView(),
  201: AllStudentView(),
  202: AddStudentView(),
  203: PromoteStudentView(),
  204: StudentIdCardView(),
  205: EditStudentView(),
  206: StudentInfoView(),
  301: AllClassesView(),
  302: NewClassesView(),
    4: HomeWorkView(),
    5: TimeTableView(),
  601: SubjectWithClassView(),
  602: CreateSubjectView(),
  701: BonafiedCertificateView(),
  702:RelievingCertificateView(),
  703: CharacterCertificateView(),
  704:TransferCertificateView(),
  801:StudentAttendenceView(),
  802:TeacherAttendenceView(),
    9:MessagesView(),
};
