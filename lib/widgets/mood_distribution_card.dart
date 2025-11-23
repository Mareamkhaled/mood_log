import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_style.dart';
import '../cubit/journal_cubit.dart';
import 'cutom_shadow.dart';

class MoodDistributionCard extends StatelessWidget {
  const MoodDistributionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final slices = context.read<JournalCubit>().getMoodSlicesForCurrentMonth();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [customShadow()],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.pie_chart_rounded,
                color: AppColors.myLightPurple,
                size: 28,
              ),
              const Gap(8),
              Text(
                'Mood Distribution',
                style: AppStyle.lemon20sPurple500.copyWith(
                  fontSize: 18,
                  color: AppColors.myBlack,
                ),
              ),
            ],
          ),

          const Gap(24),

          // Pie Chart
          SizedBox(
            height: 200,
            child: PieChart(
              PieChartData(
                sectionsSpace: 2,
                centerSpaceRadius: 50,
                sections: slices.map((slice) {
                  return PieChartSectionData(
                    value: slice['percentage'].toDouble(),
                    title: '${slice['percentage']}%',
                    color: slice['color'],
                    radius: 60,
                    titleStyle: AppStyle.lemon14swhite500,
                  );
                }).toList(),
              ),
            ),
          ),

          const Gap(24),

          ...slices.map(
            (mood) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            mood['emoji'],
                            style: const TextStyle(fontSize: 24),
                          ),
                          const Gap(8),
                          Text(
                            mood['mood'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${mood['percentage']}%',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const Gap(8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: mood['percentage'] / 100,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(mood['color']),
                      minHeight: 8,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
