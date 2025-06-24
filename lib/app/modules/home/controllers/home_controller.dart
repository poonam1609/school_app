import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../models/admissionData.dart';
import '../../../../models/chartData.dart';
import '../../../../models/classData.dart';
import '../../../../models/feeData.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  // Scaffold key for controlling Drawer from outside
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // Animation Controllers
  late final AnimationController animationController;
  late final AnimationController drawerAnimationController;

  // Navigation index and drawer state

  final Rxn<dynamic> selectedModel = Rxn<dynamic>();
  final RxInt selectedNavIndex = 0.obs;
  var selectedSubMenuIndex = 0.obs;
  var expandedTileIndex = RxnInt();
  final RxBool isDrawerOpen = false.obs;
  var previousNavIndex = 0.obs;

  // Dashboard Metrics
  final RxInt totalStudents = 1245.obs;
  final RxDouble totalRevenue = 125000.0.obs;
  final RxInt totalEmployees = 85.obs;
  final RxDouble totalProfit = 45000.0.obs;

  // Charts: Account Data
  final RxList<ChartData> accountData = <ChartData>[
    ChartData('Jan', 20000),
    ChartData('Feb', 25000),
    ChartData('Mar', 30000),
    ChartData('Apr', 35000),
    ChartData('May', 40000),
    ChartData('Jun', 45000),
  ].obs;

  // Pie Chart: Fee Collection Summary
  final RxList<FeeData> feeCollectionData = <FeeData>[

    FeeData('Collected', 50, Color(0xFF1E88E5)),
    FeeData('Pending', 50, Color(0xffB2D6FF)),
  ].obs;

  // Bar Chart: Class-wise Strength
  final RxList<ClassData> classStrengthData = <ClassData>[
    ClassData('Class 1', 45),
    ClassData('Class 2', 52),
    ClassData('Class 3', 48),
    ClassData('Class 4', 51),
    ClassData('Class 5', 47),
  ].obs;

  // Weekly Admissions Chart
  final RxList<AdmissionData> newAdmissions = <AdmissionData>[
    AdmissionData('Week 1', 12),
    AdmissionData('Week 2', 8),
    AdmissionData('Week 3', 15),
    AdmissionData('Week 4', 10),
  ].obs;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    drawerAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    animationController.forward();
  }

  @override
  void onClose() {
    animationController.dispose();
    drawerAnimationController.dispose();
    super.onClose();
  }

  /// Toggles the Drawer with animation
  void toggleDrawer() {
    isDrawerOpen.value = !isDrawerOpen.value;
    isDrawerOpen.value
        ? drawerAnimationController.forward()
        : drawerAnimationController.reverse();
  }

  void toggleTileExpansion(int index) {
    if (expandedTileIndex.value == index) {
      expandedTileIndex.value = null;
    } else {
      expandedTileIndex.value = index;
    }
  }
void selectMenu(int index){
  previousNavIndex.value = selectedNavIndex.value;
  selectedNavIndex.value = index;
  selectedSubMenuIndex.value = index;
  update();
}
  void goBackToPrevious() {
    selectedNavIndex.value = previousNavIndex.value;
    previousNavIndex.value = 0;
  }

}
