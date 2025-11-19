import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_style.dart';
import 'cutom_shadow.dart';

Widget buildMoodTrendCard() {
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
          // Header
          Row(
            children: [
            const  Icon(
                Icons.trending_up,
                color: AppColors.myLightPurple,
                size: 28,
              ),
              const Gap(8),
               Text(
                '30-Day Mood Trend',
                style: AppStyle.lemon20sPurple500.copyWith(
                  color: AppColors.myBlack
                )
              ),
            ],
          ),
          
          const Gap(24),
          
          // Line Chart
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 1,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.grey[200],
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      interval: 5,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          '${value.toInt()}',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        const moods = ['😢', '😐', '😊'];
                        if (value >= 0 && value < moods.length) {
                          return Text(
                            moods[value.toInt()],
                            style: const TextStyle(fontSize: 20),
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 30,
                minY: 0,
                maxY: 2,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 1),
                      const FlSpot(3, 2),
                      const FlSpot(6, 1.5),
                      const FlSpot(9, 2),
                      const FlSpot(12, 1),
                      const FlSpot(15, 1.5),
                      const FlSpot(18, 2),
                      const FlSpot(21, 1.8),
                      const FlSpot(24, 2),
                      const FlSpot(27, 1.5),
                      const FlSpot(30, 2),
                    ],
                    isCurved: true,
                    color: AppColors.myLightPurple,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: AppColors.primaryColor.withValues(alpha:0.1),
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