
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../cubit/journal_cubit.dart';

Widget? buildMoodCell(BuildContext context, DateTime day) {
  final entriesMap = BlocProvider.of<JournalCubit>(context).getEntriesMap();
  final entry = entriesMap.entries
      .firstWhereOrNull((e) => isSameDay(e.key, day))
      ?.value;

  if (entry != null) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: entry.color, width: 2),
      ),
      child: Center(
        child: Text(
          entry.emoji,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  return null; // ✅ Let TableCalendar render the day normally
}