import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:school_app/HelperWidget/customSearch.dart';
import 'package:school_app/HelperWidget/customText.dart';
import 'package:sizer_pro/sizer.dart';

import '../app/appTheme/customColor.dart';

class AllItemView extends StatelessWidget {
  final bool useGrid;

  final String title;
  final String searchHint;
  final Function(String)? onSearch;
  final VoidCallback? onAddNew;
  final List<dynamic> items;
  final Widget Function(dynamic item, int index) itemBuilder;

  const AllItemView({
    super.key,
    required this.title,
    this.useGrid = true,
    required this.searchHint,
    required this.items,
    required this.itemBuilder,
    this.onSearch,
    this.onAddNew,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Column(
            children: [
          CustomText(text: title,fontWeight: FontWeight.bold,fontSize: 9.sp,),
              SizedBox(height: 2.h),
              Row(
                children: [
                  Expanded(
                    child: CustomSearchInput(onChanged: (value) {

                    },),
                  ),
                  SizedBox(width: 1.w),
                  InkWell(
                    onTap: onAddNew,
                    child: Container(
                      width: 12.w,
                      height: 5.9.h,
                      decoration: BoxDecoration(
                        color: customColors?.containerBackgroundColor,
                        border: Border.all(color:  Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child:
                  Icon(Icons.person_add_alt,size: 10.sp,)
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
          Obx(() =>
              Expanded(
                child: useGrid
                    ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 6,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) => itemBuilder(items[index], index),
                )
                    : ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) => itemBuilder(items[index], index),
                ),
              ),
          ),


            ],
          ),
        ),
      ),
    );
  }
}
