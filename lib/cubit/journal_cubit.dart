import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../models/result_model.dart';
part 'journal_state.dart';

class JournalCubit extends HydratedCubit<JournalState> {
  JournalCubit() : super(const JournalLoaded([]));

  addEntry(ResultModel resultModel) {
    if (state is JournalLoaded) {
      final currentState = state as JournalLoaded;
      final updatedEntries = List<ResultModel>.from(currentState.journalList)
        ..add(resultModel);

      emit(JournalLoaded(updatedEntries));
    }
  }

  updateEntry(ResultModel updatedEntry) {
    if (state is JournalLoaded) {
      final currentState = state as JournalLoaded;
      final journal = currentState.journalList.map((entry) {
        return entry.id == updatedEntry.id ? updatedEntry : entry;
      }).toList();
      emit(JournalLoaded(journal));
    }
  }

  deleteEntry(String id) {
    if (state is JournalLoaded) {
      final currentState = state as JournalLoaded;
      final journal = currentState.journalList
          .where((entry) => entry.id != id)
          .toList();
      emit(JournalLoaded(journal));
    }
  }

  Map<DateTime, ResultModel> getEntriesMap() {
    if (state is JournalLoaded) {
      final entries = (state as JournalLoaded).journalList;
      final entriesMap = <DateTime, ResultModel>{};

      for (var entry in entries) {
        final dateKey = DateTime(
          entry.date.year,
          entry.date.month,
          entry.date.day,
        );

        entriesMap[dateKey] = entry;
      }

      return entriesMap;
    }

    return {};
  }

  getRecentEntries(int count) {
    if (state is JournalLoaded) {
      final entries = (state as JournalLoaded).journalList;
      return entries.length > count
          ? entries.sublist(entries.length - count)
          : entries;
    }
    return [];
  }

  getAllEntriesLength() {
    if (state is JournalLoaded) {
      final entries = (state as JournalLoaded).journalList;
      return entries.length;
    }
    return [];
  }
  List<ResultModel> getAllEntries() {
    if (state is JournalLoaded) {
      final entries = (state as JournalLoaded).journalList;
      return entries;
    }
    return [];
  }

  int calcStreakDays() {
    if (state is! JournalLoaded) return 0;

    final entries = (state as JournalLoaded).journalList;

    final uniqueDates =
        entries
            .map((e) => DateTime(e.date.year, e.date.month, e.date.day))
            .toSet()
            .toList()
          ..sort((a, b) => b.compareTo(a));

    if (uniqueDates.isEmpty) return 0;

    int streak = 1;
    DateTime current = uniqueDates.first;

    for (int i = 1; i < uniqueDates.length; i++) {
      final expected = current.subtract(const Duration(days: 1));
      if (uniqueDates[i] == expected) {
        streak++;
        current = uniqueDates[i];
      } else {
        break;
      }
    }

    return streak;
  }

  @override
  JournalState? fromJson(Map<String, dynamic> json) {
    final entriesJson = json['journalList'] as List<dynamic>?;
    if (entriesJson == null) return const JournalLoaded([]);

    final entries = entriesJson
        .map((e) => ResultModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return JournalLoaded(entries);
  }

  @override
  Map<String, dynamic>? toJson(JournalState state) {
    final entries = (state as JournalLoaded).journalList;
    return {'journalList': entries.map((e) => e.toJson()).toList()};
  }
}
