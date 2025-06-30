import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../HelperWidget/customText.dart';
import '../../../appTheme/customColor.dart';
import '../controllers/messages_controller.dart';

class MessagesView extends GetView<MessagesController> {
  MessagesController messagesController = Get.put(MessagesController());
  MessagesView({super.key});
  @override
  Widget build(BuildContext context) {
  return GetBuilder(
    init: messagesController,
    builder: (controller) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h),
            Center(
              child: CustomText(
                text: 'Messages',
                color: Colors.black,
                fontSize: 9.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3.h),
            // Radio selection
            Text(
              "Select",
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 6.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 1.h),
            Obx(
                  () => Column(
                children: [
                  _customRadioTile(
                    context: context,
                    label: "Class",
                    value: "Class",
                    groupValue: messagesController.selectedType.value,
                    onChanged:
                        (val) => messagesController.selectedType.value = val!,
                  ),
                  SizedBox(height: 1.5.h),
                  _customRadioTile(
                    context: context,
                    label: "Student",
                    value: "Student",
                    groupValue: messagesController.selectedType.value,
                    onChanged:
                        (val) => messagesController.selectedType.value = val!,
                  ),
                  SizedBox(height: 1.5.h),
                  _customRadioTile(
                    context: context,
                    label: "Employee",
                    value: "Employee",
                    groupValue:
                    messagesController.selectedType.value,
                    onChanged:
                        (val) =>
                        messagesController
                        .selectedType
                        .value = val!,
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
          ],
        ),
      )
    );
  },);
  }
}
Widget _customRadioTile({
  required String label,
  required String value,
  required String groupValue,
  required ValueChanged<String?> onChanged,
  required BuildContext context
}) {
  final customColors = Theme.of(context).extension<CustomColors>();
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 4.w),
    decoration: BoxDecoration(
      color: customColors?.textFieldFillColor,
      borderRadius: BorderRadius.circular(2.w),
    ),
    child: Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(fontSize: 6.sp, color: customColors?.primaryTextColor),
          ),
        ),
        Radio<String>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor:customColors?.primaryTextColor,
        ),
      ],
    ),
  );
}
