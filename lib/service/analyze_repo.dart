import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/analyze_model.dart';
import 'web_service.dart';

class AnalyzeRepo implements WebService {
  Dio dio;
  AnalyzeRepo({required this.dio});
  @override
  Future<AnalyzeModel> postSentiment(Map<String, dynamic> sentiment) async {
    try {
      final response = await dio.post(
        "j-hartmann/emotion-english-distilroberta-base",
        data: sentiment,
      );

      // final AnalyzeModel data = response.data[0][0];

      //  data
      //     .map((e) => AnalyzeModel.fromJson(e as Map<String, dynamic>))
      //     .toList();
      // return data;
      // Extract the first map
      final firstItem = response.data[0][0] as Map<String, dynamic>;

      // Convert to model
      final AnalyzeModel data = AnalyzeModel.fromJson(firstItem);

      return data;
    } catch (e) {
      debugPrint(e.toString());
      return const AnalyzeModel(label: "none", score: 0.0);
    }
  }
}
