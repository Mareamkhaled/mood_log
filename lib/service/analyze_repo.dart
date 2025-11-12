import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/analyze_model.dart';
import 'web_service.dart';

class AnalyzeRepo implements WebService {
  Dio setupDio() {
    final dio = Dio(
      BaseOptions(baseUrl: 'https://router.huggingface.co/hf-inference/models/'),
    );
    dio.options.headers = {
      "Authorization": "Bearer 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",
      "Content-Type": "application/json",
    };
    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: true,
        responseHeader: true,
        request: true,
        requestBody: true,
      ),
    );
    return dio;
  }

  AnalyzeRepo();
  @override
  Future<List<AnalyzeModel>> postSentiment(
    Map<String, dynamic> sentiment,
  ) async {
    try {
      final response = await setupDio().post(
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
