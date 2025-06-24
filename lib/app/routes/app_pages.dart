import 'package:get/get.dart';

import '../modules/add_student/bindings/add_student_binding.dart';
import '../modules/add_student/views/add_student_view.dart';
import '../modules/add_teacher/bindings/add_teacher_binding.dart';
import '../modules/add_teacher/views/add_teacher_view.dart';
import '../modules/all_classes/bindings/all_classes_binding.dart';
import '../modules/all_classes/views/all_classes_view.dart';
import '../modules/all_student/bindings/all_student_binding.dart';
import '../modules/all_student/views/all_student_view.dart';
import '../modules/all_teacher/bindings/all_teacher_binding.dart';
import '../modules/all_teacher/views/all_teacher_view.dart';
import '../modules/create_newpassword/bindings/create_newpassword_binding.dart';
import '../modules/create_newpassword/views/create_newpassword_view.dart';
import '../modules/edit_student/bindings/edit_student_binding.dart';
import '../modules/edit_student/views/edit_student_view.dart';
import '../modules/edit_teacher/bindings/edit_teacher_binding.dart';
import '../modules/edit_teacher/views/edit_teacher_view.dart';
import '../modules/forget_password/bindings/forget_password_binding.dart';
import '../modules/forget_password/views/forget_password_view.dart';
import '../modules/forgot_verification/bindings/forgot_verification_binding.dart';
import '../modules/forgot_verification/views/forgot_verification_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/new_classes/bindings/new_classes_binding.dart';
import '../modules/new_classes/views/new_classes_view.dart';
import '../modules/offer_letter/bindings/offer_letter_binding.dart';
import '../modules/offer_letter/views/offer_letter_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/password_reset_complete/bindings/password_reset_complete_binding.dart';
import '../modules/password_reset_complete/views/password_reset_complete_view.dart';
import '../modules/promote_student/bindings/promote_student_binding.dart';
import '../modules/promote_student/views/promote_student_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/student_idCard/bindings/student_id_card_binding.dart';
import '../modules/student_idCard/views/student_id_card_view.dart';
import '../modules/student_info/bindings/student_info_binding.dart';
import '../modules/student_info/views/student_info_view.dart';
import '../modules/teacher_info/bindings/teacher_info_binding.dart';
import '../modules/teacher_info/views/teacher_info_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TEACHER,
      page: () => AddTeacherView(),
      binding: AddTeacherBinding(),
    ),
    GetPage(
      name: _Paths.ALL_TEACHER,
      page: () => AllTeacherView(),
      binding: AllTeacherBinding(),
    ),
    GetPage(
      name: _Paths.OFFER_LETTER,
      page: () => OfferLetterView(),
      binding: OfferLetterBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_TEACHER,
      page: () => EditTeacherView(),
      binding: EditTeacherBinding(),
    ),
    GetPage(
      name: _Paths.TEACHER_INFO,
      page: () => const TeacherInfoView(),
      binding: TeacherInfoBinding(),
    ),
    GetPage(
      name: _Paths.ALL_STUDENT,
      page: () => AllStudentView(),
      binding: AllStudentBinding(),
    ),
    GetPage(
      name: _Paths.ADD_STUDENT,
      page: () => AddStudentView(),
      binding: AddStudentBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_STUDENT,
      page: () => const EditStudentView(),
      binding: EditStudentBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_INFO,
      page: () => const StudentInfoView(),
      binding: StudentInfoBinding(),
    ),
    GetPage(
      name: _Paths.PROMOTE_STUDENT,
      page: () => PromoteStudentView(),
      binding: PromoteStudentBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_ID_CARD,
      page: () => StudentIdCardView(),
      binding: StudentIdCardBinding(),
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_VERIFICATION,
      page: () => ForgotVerificationView(),
      binding: ForgotVerificationBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_NEWPASSWORD,
      page: () => CreateNewpasswordView(),
      binding: CreateNewpasswordBinding(),
    ),
    GetPage(
      name: _Paths.PASSWORD_RESET_COMPLETE,
      page: () => PasswordResetCompleteView(),
      binding: PasswordResetCompleteBinding(),
    ),
    GetPage(
      name: _Paths.ALL_CLASSES,
      page: () =>  AllClassesView(),
      binding: AllClassesBinding(),
    ),
    GetPage(
      name: _Paths.NEW_CLASSES,
      page: () =>  NewClassesView(),
      binding: NewClassesBinding(),
    ),
  ];
}
