import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/app_style.dart';
import '../widgets/analyze_button.dart';
import '../widgets/cutom_shadow.dart';

class WriteEntryScreen extends StatelessWidget {
  const WriteEntryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat('MMMM d, yyyy').format(now);

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
          child: Column(
            children: [
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

                    Expanded(
                      child: Column(
                        children: [
                          Text('Today', style: AppStyle.lemon20sPurple500),
                          const Gap(2),
                          Text(
                            formattedDate,
                            style: AppStyle.lemon20sPurple500,
                          ),
                        ],
                      ),
                    ),

                    // Empty space for symmetry
                    const SizedBox(width: 48),
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [customShadow()],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: TextField(
                          // controller: _textController,
                          maxLines: null,
                          expands: true,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                          decoration: InputDecoration(
                            hintText:
                                'How are you feeling today? ✨ Write about your day, your thoughts, or anything on your mind...',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[400],
                              height: 1.5,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                          ),
                          textAlignVertical: TextAlignVertical.top,
                        ),
                      ),

                      const Gap(16),

                      Divider(color: Colors.grey[200], thickness: 1),

                      const Gap(16),

                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [AnalyzeButton()],
                      ),
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
