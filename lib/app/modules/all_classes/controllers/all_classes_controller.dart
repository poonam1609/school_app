import 'package:get/get.dart';

class AllClassesController extends GetxController {
  var classList = <ClassStats>[
    ClassStats(className: 'Nursery', totalStudents: 25, boys: 11, girls: 14),
    ClassStats(className: 'First Standard', totalStudents: 29, boys: 15, girls: 14),
    // Add more classes here
  ].obs;
}
class ClassStats {
  final String className;
  final int totalStudents;
  final int boys;
  final int girls;

  ClassStats({
    required this.className,
    required this.totalStudents,
    required this.boys,
    required this.girls,
  });
}