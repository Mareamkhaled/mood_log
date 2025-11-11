import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/app_style.dart';
import '../widgets/dominant_mood_card.dart';
import '../widgets/gradient_decoration.dart';
import '../widgets/insights_card.dart';
import '../widgets/mood_distribution_card.dart';
import '../widgets/mood_trend_card.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: gradientDecoration),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // Back button
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.myDarkPurple,
                        size: 28,
                      ),
                    ),

                    // Title (centered)
                    Expanded(
                      child: Text(
                        'Analytics',
                        textAlign: TextAlign.center,
                        style: AppStyle.lemon20sPurple500,
                      ),
                    ),

                    const Gap(48),
                  ],
                ),
              ),

              // Scrollable content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const Gap(10),
                      buildDominantMoodCard(),

                      const Gap(20),

                      buildMoodDistributionCard(),

                      const Gap(20),

                      buildMoodTrendCard(),

                      const Gap(20),

                      buildInsightsCard(),

                      const Gap(30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
