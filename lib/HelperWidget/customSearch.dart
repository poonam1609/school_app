import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';

class CustomSearchInput extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;

  const CustomSearchInput({
    super.key,
    required this.onChanged,
    this.hintText = 'Search...',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon:  Icon(Icons.search,color: Colors.grey.shade600,),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 1.h),
      ),
    );
  }
}
