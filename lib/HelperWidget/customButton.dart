import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final color;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor:color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.h),
        ),
      ),
      child: Text(
        text,
        style:  TextStyle(fontSize: 5.5.sp,fontWeight: FontWeight.bold),
      ),
    );
  }
}
