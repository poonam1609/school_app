import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../app/appTheme/customColor.dart';

class CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final customColors = Theme.of(context).extension<CustomColors>();
    return Container(
      decoration: BoxDecoration(
        color: customColors?.containerBackgroundColor,
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
                color: customColors?.primaryTextColor,
              ),
            ),
            SizedBox(height: 2.h),
            TableCalendar(

              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(color:customColors?.secondaryTextColor),
                weekendStyle: TextStyle(color:Theme.of(context).primaryColor),
              ),
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: DateTime.now(),
              calendarFormat: CalendarFormat.month,
              headerStyle: HeaderStyle(
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color:customColors?.backgroundColor, // change to your desired color
                ),

                // ✅ Customize right arrow
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color:customColors?.backgroundColor, // change to your desired color
                ),

                titleTextStyle: TextStyle(color: customColors?.backgroundColor),
                formatButtonVisible: false,
                titleCentered: true,
                decoration: BoxDecoration(

                  color: customColors?.primaryTextColor,
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
                weekendTextStyle: TextStyle(color: customColors?.secondaryTextColor),

              ),
            ),
          ],
        ),
      ),
    );
  }
}