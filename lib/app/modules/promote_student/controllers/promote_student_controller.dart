import 'package:get/get.dart';

class PromoteStudentController extends GetxController {
  RxString standard_class = 'Select Class'.obs;
  RxString promoted_class = 'Select Class'.obs;
  RxBool showPromoteSection = true.obs;

  var isSelected = false.obs;
  List<String> std_class = ['Select Class','Class 1', 'Class 2', 'Class 3'];
  RxList<Student> students = <Student>[].obs;

  final Map<String, List<Student>> studentData = {
    'Class 1': [Student(name: 'Surbhi Kapoor',isFemale: true,image:"assets/image/student_img.jpg"), Student(name: 'Raj Mehra',isFemale:false,image:"assets/image/student_image.jpg")],
    'Class 2': [Student(name: 'Anita Sharma',isFemale: true,image:"assets/image/student_img.jpg")],
    'Class 3': []
  };

  @override
  void onInit() {
    super.onInit();
    ever(standard_class, (_) => fetchStudents());
  }

  void fetchStudents() {
    students.clear();
    showPromoteSection.value = false;

    if (studentData.containsKey(standard_class.value)) {
      students.addAll(studentData[standard_class.value]!);
    }

    // Show promote section only if students are present
    showPromoteSection.value = standard_class.value != 'Select Class' && students.isNotEmpty;
  }

  void toggleSelection(int index, bool? value) {
    students[index].isSelected.value = value ?? false;
  }

  void promoteSelectedStudents() {
    if (promoted_class.value == 'Select Class') return;
    List<Student> selectedStudents = students.where((s) => s.isSelected.value).toList();
    studentData[standard_class.value]!.removeWhere((s) => s.isSelected.value);
    studentData[promoted_class.value]!.addAll(selectedStudents.map((s) => Student(name: s.name,isFemale: s.isFemale, image: s.image,)));
    fetchStudents();
    Get.snackbar("Success", "Students promoted successfully");
    students.clear();
    standard_class.value = 'Select Class';
    promoted_class.value = 'Select Class';
    showPromoteSection.value = false;
  }
  void reset() {
    standard_class.value = 'Select Class';
    promoted_class.value = 'Select Class';
    students.clear();
    showPromoteSection.value = false;
  }
  void clearSelections() {
    // Remove promoted students
    students.removeWhere((student) => student.isSelected.value);

    // Reset dropdown and UI state
    promoted_class.value = 'Select Class';
  }

}

class Student {
final String image;
  final String name;
  final bool isFemale;
  RxBool isSelected = false.obs;
  Student({required this.name,required this.isFemale,required this.image});
}