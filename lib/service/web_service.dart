import '../models/analyze_model.dart';

abstract class WebService {
  Future<AnalyzeModel> postSentiment(Map<String,dynamic> sentiment);
}

