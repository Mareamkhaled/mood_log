import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_style.dart';
import 'cutom_shadow.dart';

Widget buildInsightsCard() {
    final List<Map<String, dynamic>> insights = [
      {
        'icon': '💡',
        'text': 'You\'re happiest on weekends!',
        'color': const Color(0xFFA855F7),
      },
      {
        'icon': '📈',
        'text': 'Your mood improved 15% this month',
        'color': const Color(0xFF3B82F6),
      },
      {
        'icon': '🌟',
        'text': '7 day writing streak - Keep going!',
        'color': const Color(0xFF10B981),
      },
      {
        'icon': '☀️',
        'text': 'Most entries written in the morning',
        'color': const Color(0xFFF59E0B),
      },
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
         customShadow()
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
            const  Icon(
                Icons.lightbulb_outline,
                color: AppColors.myDarkPurple,
                size: 28,
              ),
              const Gap(8),
               Text(
                'Insights',
                style: AppStyle.lemon20sPurple500.copyWith(
                  color: AppColors.myBlack
                )
              ),
            ],
          ),
          
          const Gap(20),
          
          ...insights.map((insight) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: insight['color'].withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border(
                left: BorderSide(
                  color: insight['color'],
                  width: 4,
                ),
              ),
            ),
            child: Row(
              children: [
                Text(
                  insight['icon'],
                  style: const TextStyle(fontSize: 24),
                ),
                const Gap(12),
                Expanded(
                  child: Text(
                    insight['text'],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }