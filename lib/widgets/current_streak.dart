import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_style.dart';
import 'custom_container.dart';

class CurrentStreak extends StatelessWidget {
  const CurrentStreak({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Row(
            children: [
              Text("Current Streak", style: AppStyle.lemon15sPurple400),
              const Spacer(),
              Text("Total Entries", style: AppStyle.lemon15sPurple400),
            ],
          ),
          const Gap(10),
          Row(
            children: [
              Text("7 days 🔥", style: AppStyle.lemon20sPurple500),
              const Spacer(),
              Text(
                "23",
                style: AppStyle.lemon20sPurple500.copyWith(
                  color: AppColors.myBlue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
