import 'package:flutter/material.dart';

import '../core/utils/app_style.dart';
import '../screens/analytics_screen.dart';
import 'custom_container.dart';

class CustomCalender extends StatelessWidget {
  const CustomCalender({super.key});

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

          CalendarDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime(2025, 10, 1),
            lastDate: DateTime(2036, 12, 31),
            onDateChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
