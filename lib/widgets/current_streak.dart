import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'custom_container.dart';

class CurrentStreak extends StatelessWidget {
  const CurrentStreak({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomContainer(
      child: Column(
        children: [
          Row(
            children: [Text("Current Streak"), Spacer(), Text("Total Entries")],
          ),
          Gap(10),
          Row(children: [Text("7 days 🔥"), Spacer(), Text("23")]),
        ],
      ),
    );
  }
}
