import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/analyze_model.dart';
import '../service/web_service.dart';

part 'analyze_state.dart';

class AnalyzeCubit extends Cubit<AnalyzeState> {
  AnalyzeCubit({required this.webService}) : super(AnalyzeLoading());
  WebService webService;

  Future<void> getSentiment(Map<String, dynamic> sentiment) async {
    emit(AnalyzeLoading());
    try {
      final response = await webService.postSentiment(sentiment);
      emit(AnalyzeLoaded(response));
    } catch (e) {
      emit(CubitError(e.toString()));
    }
  }
}
