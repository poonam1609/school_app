import 'package:get/get.dart';

class TimeTableController extends GetxController {
  var selectedClass = 'Select'.obs;
  final List<String> classList = ['Select', 'KG - 2', '10A', '10D', '11A', '12C', '3B'];

  var timetables = <Map<String, dynamic>>[
    {"label": "KG - 2", "image": "assets/image/time_table_img2.jpg"},
    {"label": "12C", "image": "assets/image/time_table_img2.jpg"},
    {"label": "11A", "image": "assets/image/time_table_img2.jpg"},
    {"label": "10D", "image": "assets/image/time_table_img2.jpg"},
    {"label": "10A", "image": "assets/image/time_table_img2.jpg"},
    {"label": "3B", "image": "assets/image/time_table_img2.jpg"},
  ].obs;

  void submit() {
    Get.snackbar("Submitted", "Timetable added for ${selectedClass.value}");
  }

  void refresh() {
    // Optional refresh logic
  }
}
