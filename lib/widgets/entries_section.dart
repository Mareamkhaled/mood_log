import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_style.dart';
import '../cubit/journal_cubit.dart';
import '../screens/entry_details.dart';
import 'custom_container.dart';

class EntriesSection extends StatelessWidget {
  const EntriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Entries",
            style: AppStyle.lemon20sPurple500.copyWith(
              color: AppColors.myBlack,
            ),
          ),

          BlocBuilder<JournalCubit, JournalState>(
            builder: (context, state) {
              if (state is JournalLoaded) {
                final entries = context
                    .read<JournalCubit>()
                    .getRecentEntries(3)
                    .reversed
                    .toList();
                if (entries.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        'No entries yet. Start writing!',
                        style: TextStyle(color: Colors.grey[500], fontSize: 16),
                      ),
                    ),
                  );
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: entries.length,
                  separatorBuilder: (context, index) => const Gap(12),
                  itemBuilder: (context, index) {
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
                              entries[index].emoji,
                              style: const TextStyle(fontSize: 32),
                            ),
                            const Gap(12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    entries[index].mood,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  const Gap(4),
                                  Text(
                                    DateFormat.yMMMd().format(
                                      entries[index].date,
                                    ),

                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    settings: RouteSettings(
                                      arguments: entries[index],
                                    ),
                                    builder: (context) => const EntryDetails(),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
