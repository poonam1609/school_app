import 'package:flutter/material.dart';

class DrawerSubItem {
  final String title;
  final int index;
  final IconData icon;
  final VoidCallback? onTap;

  DrawerSubItem({
    required this.title,
    required this.index,
    required this.icon,
    this.onTap,
  });
}
class DrawerSection {
  final String title;
  final IconData icon;
  final int index;
  final List<DrawerSubItem>? subItems;

  DrawerSection({
    required this.title,
    required this.icon,
    required this.index,
    this.subItems,
  });
}
