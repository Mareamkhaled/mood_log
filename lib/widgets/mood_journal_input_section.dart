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
    return Column(
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
            ElevatedButton.icon(
              onPressed: () async {
                final response = await context
                    .read<AnalyzeCubit>()
                    .getSentiment({"inputs": textController.text});
                final res = response[0];
                if (!context.mounted) return;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: RouteSettings(arguments: res),
                    builder: (context) {
                      return const ResultScreen();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.save, color: Colors.white, size: 20),
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
                shadowColor: AppColors.primaryColor.withValues(alpha: 0.4),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
