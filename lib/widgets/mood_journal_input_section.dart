import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../core/utils/app_colors.dart';
import '../cubit/analyze_cubit.dart';
import '../screens/result_screen.dart';

class MoodJournalInputSection extends StatefulWidget {
  const MoodJournalInputSection({super.key});

  @override
  State<MoodJournalInputSection> createState() =>
      _MoodJournalInputSectionState();
}

class _MoodJournalInputSectionState extends State<MoodJournalInputSection> {
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AnalyzeCubit, AnalyzeState>(
      listener: (context, state) {
        if (state is AnalyzeLoaded) {
          Navigator.push(
            context,
            MaterialPageRoute(
          settings: RouteSettings(arguments: state.analyzeList[0]),

              builder: (context) =>const ResultScreen(
              
              ),
            ),
          );
        }

        if (state is AnalyzeFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      child: Column(
        children: [
          Expanded(
            child: TextField(
              controller: textController,
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

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BlocBuilder<AnalyzeCubit, AnalyzeState>(
                builder: (context, state) {
                  final isLoading = state is AnalyzeLoading;

                  return ElevatedButton.icon(
                    onPressed: isLoading
                        ? null 
                        : () async {
                            if (textController.text.trim().isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please write something to analyze'),
                                  backgroundColor: Colors.red,
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                              return;
                            }
                            await context.read<AnalyzeCubit>().getSentiment({
                              "inputs": textController.text,
                            });
                          },
                       icon: isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Icon(Icons.save, color: Colors.white, size: 20),
                    label: Text(
                      isLoading ? 'Analyzing...' : 'Save & Analyze',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isLoading
                          ? AppColors.myLightPurple.withValues(alpha:0.7)
                          : AppColors.myLightPurple,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: isLoading ? 0 : 4,
                      shadowColor: AppColors.primaryColor.withValues(alpha: 0.4),
                      disabledBackgroundColor: AppColors.myLightPurple.withValues(alpha:0.7),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}