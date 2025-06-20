import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../HelperWidget/customButton.dart';
import '../../../../HelperWidget/customText.dart';
import '../../../../HelperWidget/customeTextfield.dart';
import '../../../routes/app_pages.dart';
import '../controllers/create_newpassword_controller.dart';

class CreateNewpasswordView extends GetView<CreateNewpasswordController> {
  final _formKey = GlobalKey<FormState>();
  CreateNewpasswordController createNewpasswordController = Get.put(CreateNewpasswordController());
  CreateNewpasswordView({super.key});
  @override
  Widget build(BuildContext context) {
   return GetBuilder(
     init:createNewpasswordController ,
     builder: (controller) {
     return Scaffold(
         appBar: AppBar(
           backgroundColor: Colors.transparent,
           leading: IconButton(onPressed: (){
             Get.back();
           }, icon: Icon(Icons.arrow_circle_left_outlined)),
         ),
         body: Container(
           decoration: BoxDecoration(
             gradient: LinearGradient(
               colors: [Color(0xFF1E88E5).withOpacity(0.5), Color(0xffF0F1F5)],
               begin: Alignment.bottomCenter,
               end: Alignment.center,
             ),
           ),
           child: SafeArea(
               child: Form(
                 key: _formKey,
                 child: Padding(
                   padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 3.h),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       CustomText(text: "Create a new password",fontSize:7.sp ,fontWeight: FontWeight.bold,color: Colors.grey.shade800,),
                       SizedBox(height:3.h),
                       Row(
                         children: [
                           CustomText(text: "Code Verified",fontWeight: FontWeight.bold,fontSize:6.sp,color: Colors.grey.shade800),
                           SizedBox(width:1.w),
                           SvgPicture.asset('assets/icons/icon_verified.svg')
                         ],
                       ),
                       SizedBox(height:0.5.h),
                       CustomText(text: "Time for a fresh password! Make sure it’s not one you’ve used before.",fontSize:4.8.sp,color: Color(0xff989898),fontWeight: FontWeight.bold),
                       SizedBox(height:3.h),
                       CustomText(text: "New Password",color: Colors.grey.shade600,fontSize:6.sp,fontWeight: FontWeight.bold,),
                       SizedBox(height:1.h),
                       CustomTextField(
                           prefixIcon: Icons.lock_outline,
                           controller: createNewpasswordController.newPasswordController, obscureText: false),
                       SizedBox(height: 2.h,),
                       CustomText(text: "Confirm Password",color: Colors.grey.shade600,fontSize:6.sp,fontWeight: FontWeight.bold,),
                       SizedBox(height:1.h),
                       CustomTextField(
                           prefixIcon: Icons.lock_outline,
                           controller: createNewpasswordController.newPasswordController,obscureText: false),
                       SizedBox(height: 4.h,),
                       PrimaryButton(text: 'Reset Password', onPressed: (){
                         Get.toNamed(Routes.PASSWORD_RESET_COMPLETE);
                       },color: Theme.of(context).primaryColor,)
                     ],
                   ),
                 ),
               )),
         )
     );
   },);
  }
}
