import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../core/utils/app_colors.dart';
import '../cubit/analyze_cubit.dart';
import '../cubit/journal_cubit.dart';
import '../models/result_model.dart';
import '../screens/result_screen.dart';

class MoodJournalInputSection extends StatefulWidget {
  final ResultModel? entryToEdit;
  final bool isEditing;

  const MoodJournalInputSection({
    super.key,
    this.entryToEdit,
    this.isEditing = false,
  });

  @override
  State<MoodJournalInputSection> createState() =>
      _MoodJournalInputSectionState();
}

class _MoodJournalInputSectionState extends State<MoodJournalInputSection> {
  late final TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    if (widget.isEditing && widget.entryToEdit != null) {
      textController.text = widget.entryToEdit!.text;
    }
  }

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
          final resultModel = state.analyzeList;

          if (widget.isEditing && widget.entryToEdit != null) {
            final updatedEntry = ResultModel(
              id: widget.entryToEdit!.id,
              text: textController.text,
              mood: resultModel.mood,
              score: resultModel.score,
              emoji: resultModel.emoji,
              color: resultModel.color,
              date: widget.entryToEdit!.date,
            );

            context.read<JournalCubit>().updateEntry(updatedEntry);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ResultScreen(),
                settings: RouteSettings(arguments: updatedEntry),
              ),
            );
          } else {
            final newEntry = ResultModel(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              text: textController.text,
              mood: resultModel.mood,
              score: resultModel.score,
              emoji: resultModel.emoji,
              color: resultModel.color,
              date: DateTime.now(),
            );

            context.read<JournalCubit>().addEntry(newEntry);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ResultScreen(),
                settings: RouteSettings(arguments: newEntry),
              ),
            );
          }
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
                                  content: Text(
                                    'Please write something before saving',
                                  ),
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
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          )
                        : const Icon(Icons.save, color: Colors.white, size: 20),
                    label: Text(
                      isLoading
                          ? 'Analyzing...'
                          : widget.isEditing
                          ? 'Update Entry'
                          : 'Save & Analyze',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isLoading
                          ? AppColors.myLightPurple.withValues(alpha: 0.7)
                          : AppColors.myLightPurple,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: isLoading ? 0 : 4,
                      shadowColor: AppColors.primaryColor.withValues(
                        alpha: 0.4,
                      ),
                      disabledBackgroundColor: AppColors.myLightPurple
                          .withValues(alpha: 0.7),
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
