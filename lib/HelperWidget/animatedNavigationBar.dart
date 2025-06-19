import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer_pro/sizer.dart';
import '../app/modules/home/controllers/home_controller.dart';

class AnimatedNavigationBar extends StatelessWidget {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Obx(() {
        int index = controller.selectedNavIndex.value;
        if (index < 0 || index >= 4) {
          index = 0;
        }
        return BottomNavigationBar(
          currentIndex: index,
          onTap: (i) {
             controller.selectedNavIndex.value = i;
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFF4A90E2),
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 2,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/icon_home.svg',
                color: index == 0 ? Colors.blue : Colors.grey.shade600,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/icon_search.svg',
                color: index == 1 ? Colors.blue : Colors.grey.shade600,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/icon_user.svg',
                color: index == 2 ? Colors.blue : Colors.grey.shade600,
              ),
              label: 'Profile',
            ),
          ],
        );
      }),
    );
  }
}
