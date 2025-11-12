import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/analyze_model.dart';
import 'web_service.dart';

class AnalyzeRepo implements WebService {
  Dio dio;
  AnalyzeRepo({required this.dio});
  @override
  Future<List<AnalyzeModel>> postSentiment(
    Map<String, dynamic> sentiment,
  ) async {
    try {
      final response = await dio.post(
        "j-hartmann/emotion-english-distilroberta-base",
        data: sentiment,
      );

      final List<dynamic> data = response.data[0];

      final List<AnalyzeModel> emotions = data
          .map((e) => AnalyzeModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return emotions;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
