import 'package:flutter/material.dart';

import 'custom_container.dart';

class CustomCalender extends StatelessWidget {
  const CustomCalender({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
                // vertical: 1,
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text("View Analytics")],
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