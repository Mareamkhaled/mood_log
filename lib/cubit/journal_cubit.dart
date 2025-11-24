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
        if (entriesMap.containsKey(dateKey)) {
          final existing = entriesMap[dateKey]!;
          if (entry.date.isAfter(existing.date)) {
            entriesMap[dateKey] = entry;
          }
        } else {
          entriesMap[dateKey] = entry;
        }

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

  // In journal_cubit.dart
  //!
  List<ResultModel> getEntriesForCurrentMonth() {
    if (state is! JournalLoaded) return [];

    final entries = (state as JournalLoaded).journalList;
    final now = DateTime.now();

    // Filter entries from current month only
    final thisMonthEntries = entries.where((entry) {
      return entry.date.year == now.year && entry.date.month == now.month;
    }).toList();
    return thisMonthEntries;
  }

  Map<String, dynamic> getDominantMoodForCurrentMonth() {
    final thisMonthEntries = getEntriesForCurrentMonth();

    if (thisMonthEntries.isEmpty) {
      return {'mood': 'None', 'percentage': 0};
    }

    final counts = <String, int>{};

    for (var entry in thisMonthEntries) {
      counts[entry.mood] = (counts[entry.mood] ?? 0) + 1;
    }
    // counts  {joy: 2, none: 1, anger: 1, surprise: 1, sadness: 1}
    final percentages = <String, int>{};
    counts.forEach((mood, count) {
      final percentage = ((count / thisMonthEntries.length) * 100).toInt();
      percentages[mood] = percentage;
    });
    //percentages {joy: 33, none: 16, anger: 16, surprise: 16, sadness: 16}
    // if (percentages.isEmpty) {
    //   return {'mood': 'None', 'percentage': 0};
    // }
    String dominantMood = percentages.keys.first;
    int highestPercentage = percentages[dominantMood] ?? 0;

    for (var entry in percentages.entries) {
      if (entry.value > highestPercentage) {
        highestPercentage = entry.value;
        dominantMood = entry.key;
      }
    }

    final matchedEntry = thisMonthEntries.firstWhere(
      (entry) => entry.mood == dominantMood,
      orElse: () => thisMonthEntries.first,
    );

    final emoji = matchedEntry.emoji;

    final color = matchedEntry.color;

    return {
      'mood': dominantMood,
      'percentage': highestPercentage,
      'emoji': emoji,
      'color': color,
    };
  }

  List<Map<String, dynamic>> getMoodSlicesForCurrentMonth() {
    final entries = getEntriesForCurrentMonth();
    if (entries.isEmpty) return [];

    final counts = <String, int>{};
    final moodMeta = <String, Map<String, dynamic>>{};

    for (var entry in entries) {
      final mood = entry.mood;
      counts[mood] = (counts[mood] ?? 0) + 1;
      moodMeta[mood] ??= {'emoji': entry.emoji, 'color': entry.color};
    }
    final total = entries.length;

    return counts.entries.map((e) {
      final mood = e.key;
      final percentage = ((e.value / total) * 100).toInt();
      return {
        'mood': mood,
        'percentage': percentage,
        'emoji': moodMeta[mood]?['emoji'] ?? '',
        'color': moodMeta[mood]?['color'],
      };
    }).toList();
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
