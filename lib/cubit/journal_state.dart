part of 'journal_cubit.dart';

sealed class JournalState  {
  const JournalState();

}

final class JournalLoaded extends JournalState {
  final List<ResultModel> journalList;
  const JournalLoaded(this.journalList);
}

