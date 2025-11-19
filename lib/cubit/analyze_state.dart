part of 'analyze_cubit.dart';

abstract class AnalyzeState extends Equatable {
  const AnalyzeState();
}

class AnalyzeInitial extends AnalyzeState {
  @override
  List<Object> get props => [];
}
class AnalyzeLoading extends AnalyzeState {
  @override
  List<Object> get props => [];
}
// class AddSavedEntry extends AnalyzeState {
//   final ResultModel resultModel;
//   const AddSavedEntry(this.resultModel);
//   @override
//   List<Object> get props => [];
  
// }

class AnalyzeLoaded extends AnalyzeState {
  final ResultModel analyzeList;
  const AnalyzeLoaded(this.analyzeList);
  @override
  List<Object> get props => [analyzeList];
}
class AnalyzeFailure extends AnalyzeState {
  final String message;
  const AnalyzeFailure(this.message);
  @override
  List<Object> get props => [message];
}
