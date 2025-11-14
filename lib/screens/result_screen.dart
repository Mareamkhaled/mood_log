import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/app_style.dart';
import '../models/analyze_model.dart';
import '../models/result_model.dart';
import '../widgets/cutom_shadow.dart';
class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key, });

  @override
  Widget build(BuildContext context) {
    AnalyzeModel response = ModalRoute.of(context)!.settings.arguments as  AnalyzeModel;
    final result = ResultModel.result[response.label];
    return Scaffold(
      body: Container(
         decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,  
            end: Alignment.bottomRight, 
            colors: [AppColors.primaryColor, AppColors.secondaryColor],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: AppColors.myWhite,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      customShadow()
                    ],
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          result["emoji"],
                          style: const TextStyle(fontSize: 70),
                        ),
                      ),
                
                      const Gap(20),

                       Text(
                        'Entry Saved!',
                        style: AppStyle.lemon20sPurple500.copyWith(
                          color: AppColors.myBlack,
                          // fontSize: 20
                        )
                      ),
                
                      const Gap(8),
                
                      // Subtitle
                      Text(
                        'We detected your mood',
                        style:AppStyle.lemon15sGrey400.copyWith(
                          fontSize: 17
                        )
                      ),
                
                      const Gap(24),
                
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: result["color"],
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.primaryColor,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          children: [
                            // Mood name
                            Text(
                              response.label,
                              style:AppStyle.lemon15sGrey400.copyWith(
                                color: AppColors.myBlack,
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                              )
                            ),
                
                            const Gap(8),
                
                            // Confidence
                            Text(
                              '${(response.score * 100).toStringAsFixed(0)}% confidence',
                              style: AppStyle.lemon15sGrey400.copyWith(
                                color: AppColors.myBlack
                              )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(
                            context,
                          ).popUntil((route) => route.isFirst);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 4,
                          shadowColor: Colors.black.withValues(alpha:0.2),
                        ),
                        child:  Text(
                          'View Calendar',
                          style: AppStyle.lemon20sPurple500
                        ),
                      ),
                    ),

                    const Gap(12),

                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          // Go back to write screen
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white, width: 2),
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child:  Text(
                          'Write Another Entry',
                          style: AppStyle.lemon20sPurple500.copyWith(
                            fontSize: 18
                          )
                        ),
                      ),
                    ),
                  ],
                ),

                const Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
