// lib/env/env.dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'baseUrl')
  static const String baseURL = _Env.baseURL;
  @EnviedField(varName: 'apiKey')
  static const String apiKey = _Env.apiKey;
}
