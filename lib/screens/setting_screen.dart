import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_style.dart';
import '../widgets/gradient_decoration.dart';
import '../widgets/setting_container.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: gradientDecoration),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Gap(70),
              SettingContainer(
                color: AppColors.myWhite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: Text(
                        "Export Data",
                        style: AppStyle.lemon15sGrey400.copyWith(
                          color: AppColors.myBlack,
                        ),
                      ),
                    ),
                    const Divider(),
                    Text(
                      "Privacy Policy",
                      style: AppStyle.lemon15sGrey400.copyWith(
                        color: AppColors.myBlack,
                      ),
                    ),
                  ],
                ),
              ),

              const Gap(20),

              SettingContainer(
                color: AppColors.myLightBlue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "🔒 Your Privacy Matters",
                      style: AppStyle.lemon15sGrey400.copyWith(
                        color: AppColors.myBlack,
                      ),
                    ),

                    const Gap(10),
                    Text(
                      "All your journal entries and mood data stay on your device. Nothing is sent to servers.",
                      style: AppStyle.lemon15sGrey400.copyWith(
                        fontSize: 10
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
