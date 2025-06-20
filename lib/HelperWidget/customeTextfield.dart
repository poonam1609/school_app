import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sizer_pro/sizer.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData? icon;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator; // Optional validator
  final bool enabled;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final RxBool? isPasswordVisible;
  final VoidCallback? togglePasswordVisibility;
  final Color? color;



  CustomTextField({
    Key? key,
    required this.controller,

    this.icon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.enabled = true,

    required bool obscureText,
    this.isPasswordVisible,
    this.togglePasswordVisibility,
    this.prefixIcon,
    this.suffixIcon, this.onSuffixTap, this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isPassword && isPasswordVisible != null
        ? Obx(() {
          return TextFormField(
            controller: controller,
            obscureText:
                isPassword ? !(isPasswordVisible?.value ?? false) : false,
            keyboardType: keyboardType,
            enabled: enabled,
            validator: validator,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),

              prefixIcon: prefixIcon != null
                  ? Icon(prefixIcon, color: Colors.black54)
                  : null,
              suffixIcon: isPassword && isPasswordVisible != null
                  ? IconButton(
                icon: Icon(
                  isPasswordVisible!.value ? Icons.visibility : Icons.visibility_off,
                  color:  Colors.black54,
                ),
                onPressed: togglePasswordVisibility,
              )
                  : suffixIcon != null
                  ? GestureDetector(
                onTap: onSuffixTap,
                child: Icon(suffixIcon, color: Theme.of(context).primaryColor),
              )
                  : null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.h),
                borderSide: BorderSide(color: color ?? Colors.grey, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.h),
                borderSide: BorderSide(color: color ?? Theme.of(context).primaryColor, width: 1),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.h),
                borderSide: BorderSide(color: Colors.red, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.h),
                borderSide: BorderSide(color: Colors.red, width: 1),
              ),

              border: OutlineInputBorder(
                borderSide: BorderSide( color: color ?? Colors.transparent,),
                borderRadius: BorderRadius.circular(1.h),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          );
        })
        : TextFormField(
          controller: controller,
          obscureText: isPassword,
          validator: validator,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),

            prefixIcon:
            prefixIcon  != null
                    ? Icon(prefixIcon, color: Colors.black54)
                    : null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(1.h)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(1.h),
              borderSide: BorderSide(color: color ?? Colors.grey.shade300, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(1.h),
              borderSide: BorderSide(color: color ?? Theme.of(context).primaryColor, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(1.h),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(1.h),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),

            filled: true,
            fillColor: Colors.white,
          ),
        );
  }
}
