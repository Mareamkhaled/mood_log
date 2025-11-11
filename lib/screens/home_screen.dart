import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../core/utils/app_colors.dart';
import '../widgets/current_streak.dart';
import '../widgets/custom_calender.dart';
import '../widgets/custom_floating_button.dart';
import '../widgets/entries_section.dart';
import '../widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,  
            end: Alignment.bottomRight, 
            colors: [AppColors.primaryColor, AppColors.secondaryColor],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(MediaQuery.of(context).padding.top + 5),
                homeAppBar(),
                const CurrentStreak(),
                const Gap(20),
                const CustomCalender(),
                const Gap(20),
              const EntriesSection(),
                const Gap(80), 
              ],
            ),
          ),
        ),
      ),
      
      floatingActionButton: const CustomFloatingButton()
    );
  }
}