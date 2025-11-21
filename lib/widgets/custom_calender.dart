import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../core/utils/app_style.dart';
import '../screens/analytics_screen.dart';
import 'custom_container.dart';

class CustomCalender extends StatefulWidget {
  const CustomCalender({super.key});

  @override
  State<CustomCalender> createState() => _CustomCalenderState();
}

class _CustomCalenderState extends State<CustomCalender> {
      CalendarFormat _calendarFormat = CalendarFormat.month;
DateTime _focusedDay = DateTime.now();
DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
   
    return CustomContainer(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text(
                  "View Analytics",
                  style: AppStyle.lemon20sPurple500.copyWith(fontSize: 15),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AnalyticsScreen();
                  },));
                },
              ),
            ],
          ),

        TableCalendar(
  firstDay: DateTime.utc(2020, 1, 1),
  lastDay: DateTime.utc(2030, 12, 31),
  focusedDay: _focusedDay,
  calendarFormat: _calendarFormat,
  onFormatChanged: (format) {
    setState(() {
      _calendarFormat = format;
    });
  },
  onPageChanged: (focusedDay) {
    _focusedDay = focusedDay;
  },
  onDaySelected: (selectedDay, focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  },
    
  selectedDayPredicate: (day) {
    return isSameDay(day, _selectedDay);
  },
)

        ],
      ),
    );
  }
}
