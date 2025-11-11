import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../core/utils/app_style.dart';

Widget buildDominantMoodCard() {
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
            color: const Color(0xFFFBBF24).withValues(alpha:0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          
          const Text(
            '😊',
            style: TextStyle(fontSize: 64),
          ),
          
          const Gap(16),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'This Month',
                  style: AppStyle.lemon14swhite500
                ),
                const Gap(4),
                Text(
                  'Mostly Happy',
                  style:  AppStyle.lemon14swhite500.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  )
                ),
                const Gap(4),
                Text(
                  '40% of your entries',
                  style:  AppStyle.lemon14swhite500
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }