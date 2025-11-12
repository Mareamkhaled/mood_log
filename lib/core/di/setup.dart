import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../cubit/analyze_cubit.dart';
import '../../service/analyze_repo.dart';
import '../../service/web_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<WebService>(() => AnalyzeRepo(dio: setupDio()));
  getIt.registerFactory<AnalyzeCubit>(
    () => AnalyzeCubit(webService: getIt<WebService>()),
  );
}

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
