import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';

class AnalyzeButton extends StatelessWidget {
  const AnalyzeButton({super.key});


  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
                            onPressed: (){},
                            icon: const Icon(
                              Icons.save,
                              color: Colors.white,
                              size: 20,
                            ),
                            label: const Text(
                              'Save & Analyze',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.myLightPurple,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 4,
                              shadowColor: AppColors.primaryColor.withOpacity(0.4),
                            ),
                          );
  }
}