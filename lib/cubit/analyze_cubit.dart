import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/analyze_model.dart';
import '../models/result_model.dart';
import '../service/web_service.dart';

part 'analyze_state.dart';

class AnalyzeCubit extends Cubit<AnalyzeState> {
  AnalyzeCubit({required this.webService}) : super(AnalyzeInitial());
  WebService webService;

  Future<ResultModel> getSentiment(Map<String, dynamic> sentiment) async {
    emit(AnalyzeLoading());
     try {
    final AnalyzeModel model = await webService.postSentiment(sentiment);

    final result = ResultModel.moodJournal(model);

    emit(AnalyzeLoaded(result));
    return result;
  } catch (e) {
    emit(AnalyzeFailure(e.toString()));
    return ResultModel.moodJournal(
      const AnalyzeModel(label: "none", score: 0.0),
    );
  }
  }  
}
