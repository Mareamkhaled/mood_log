part of 'analyze_cubit.dart';

abstract class AnalyzeState extends Equatable {
  const AnalyzeState();
}

class AnalyzeLoading extends AnalyzeState {
  @override
  List<Object> get props => [];
}

class AnalyzeLoaded extends AnalyzeState {
  final List<AnalyzeModel> analyzeList;
  const AnalyzeLoaded(this.analyzeList);
  @override
  List<Object> get props => [analyzeList];
}

class CubitError extends AnalyzeState {
  final String message;
  const CubitError(this.message);
  @override
  List<Object> get props => [message];
}
