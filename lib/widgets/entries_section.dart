import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_style.dart';
import 'custom_container.dart';

class EntriesSection extends StatelessWidget {
  const EntriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, 
                    children: [
                      Text(
                        "Recent Entries",
                        style: AppStyle.lemon20sPurple500.copyWith(
                          color: AppColors.myBlack,
                          // fontWeight: FontWeight.bold
                        )
                      ),
                      // const Gap(5),
                      
                      ListView.separated(
                        shrinkWrap: true, 
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        separatorBuilder: (context, index) => const Gap(12),
                        itemBuilder: (context, index) {
                          final entries = [
                            {'emoji': '😊', 'mood': 'Happy', 'date': 'Jan 9'},
                            {'emoji': '😐', 'mood': 'Neutral', 'date': 'Jan 8'},
                            {'emoji': '😢', 'mood': 'Sad', 'date': 'Jan 7'},
                          ];
                          
                          final entry = entries[index];
                          
                          return InkWell(
                            onTap: () {
                              //!Navigate to entry screen
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  Text(
                                    entry['emoji']!,
                                    style: const TextStyle(fontSize: 32),
                                  ),
                                  const Gap(12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          entry['mood']!,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey[800],
                                          ),
                                        ),
                                        const Gap(4),
                                        Text(
                                          entry['date']!,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  
                                  // ADDED: Arrow indicator
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16,
                                    color: Colors.grey[400],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
  }
}