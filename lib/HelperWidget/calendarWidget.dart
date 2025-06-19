import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Calendar',
              style: TextStyle(
                fontSize: 7.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 2.h),
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: DateTime.now(),
              calendarFormat: CalendarFormat.month,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                decoration: BoxDecoration(
                  color: Color(0xFF4A90E2).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Color(0xFF4A90E2),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Color(0xFF4A90E2).withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}