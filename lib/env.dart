import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'MOODLENS_LITE_KEY')
  static final String apiKey = _Env.apiKey;
}
