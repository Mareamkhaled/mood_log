import '../models/analyze_model.dart';

abstract class WebService {
  Future<List<AnalyzeModel>> postSentiment(Map<String,dynamic> sentiment);
}

