import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_style.dart';
import '../cubit/journal_cubit.dart';
import 'custom_container.dart';

class CurrentStreak extends StatelessWidget {
  const CurrentStreak({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Row(
            children: [
              Text("Current Streak", style: AppStyle.lemon15sGrey400),
              const Spacer(),
              Text("Total Entries", style: AppStyle.lemon15sGrey400),
            ],
          ),
          const Gap(10),
          Row(
            children: [
              Text("${ BlocProvider.of<JournalCubit>(
                      context,
                      listen: true,
                    ).calcStreakDays()}", style: AppStyle.lemon20sPurple500),
              const Spacer(),
              Text(
                "${ BlocProvider.of<JournalCubit>(context, listen: false,).getAllEntriesLength()}",
                style: AppStyle.lemon20sPurple500.copyWith(
                  color: AppColors.myBlue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
