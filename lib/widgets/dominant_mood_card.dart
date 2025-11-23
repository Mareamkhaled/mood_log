import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../core/utils/app_style.dart';
import '../cubit/journal_cubit.dart';

class DominantMoodCard extends StatelessWidget {
  const DominantMoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    var dominantMood = context
        .read<JournalCubit>()
        .getDominantMoodForCurrentMonth();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFBBF24), Color(0xFFF59E0B)],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFBBF24).withValues(alpha: 0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(dominantMood["emoji"], style: const TextStyle(fontSize: 40)),

          const Gap(16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('This Month', style: AppStyle.lemon14swhite500),
                const Gap(4),
                Text(
                  'Mostly ${dominantMood["mood"]}',
                  style: AppStyle.lemon14swhite500.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(4),
                Text(
                  '${dominantMood["percentage"]}% of your entries',
                  style: AppStyle.lemon14swhite500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
