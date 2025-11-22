import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../cubit/analyze_cubit.dart';
import '../../cubit/journal_cubit.dart';
import '../../env.dart';
import '../../service/analyze_repo.dart';
import '../../service/web_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<WebService>(() => AnalyzeRepo(dio: setupDio()));
  getIt.registerFactory<AnalyzeCubit>(
    () => AnalyzeCubit(webService: getIt<WebService>()),
  );
  getIt.registerFactory<JournalCubit>(() => JournalCubit());
}

Dio setupDio() {
  final dio = Dio(
    BaseOptions(baseUrl: "https://router.huggingface.co/hf-inference/models/"),
  );
  dio.options.headers = {
    "Authorization": "Bearer ${Env.apiKey}",
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
