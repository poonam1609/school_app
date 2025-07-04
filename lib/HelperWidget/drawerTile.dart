import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../app/appTheme/customColor.dart';
import '../app/modules/home/controllers/home_controller.dart';
import '../models/drawerModel.dart';

class DrawerItemTile extends StatelessWidget {
  final DrawerSection section;
  final HomeController controller;

  const DrawerItemTile({
    Key? key,
    required this.section,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return Obx(() {
      final isExpanded = controller.expandedTileIndex.value == section.index;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            leading: Icon(section.icon, color: customColors?.primaryTextColor),
            title: Text(
              section.title,
              style: TextStyle( color: customColors?.primaryTextColor),
            ),
            onTap: () {
              if (section.subItems == null) {
                controller.selectedNavIndex.value = section.index;
                controller.expandedTileIndex.value = null;
                Navigator.of(context).pop();
              } else {
                controller.toggleTileExpansion(section.index);
              }
            },
          ),
          if (isExpanded && section.subItems != null)
            ...section.subItems!.map((subItem) {
              return Padding(
                padding: const EdgeInsets.only(left: 40),
                child: ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  leading: Icon(subItem.icon, size: 20,color: customColors?.buttonColor,),
                  title: Text(subItem.title,style: TextStyle(color: customColors?.buttonColor,),),
                  onTap: () {
                    controller.selectedSubMenuIndex(subItem.index);
                    print("--->>>>${ controller.selectedSubMenuIndex(subItem.index)}");
                    controller.selectedNavIndex.value = subItem.index;
                    controller.expandedTileIndex.value = null;
                    Get.back();
                  },
                ),
              );
            }).toList(),
        ],
      );
    });
  }
}