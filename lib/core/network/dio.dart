import 'package:CreativeFabrica/core/utils/env.dart';
import 'package:dio/dio.dart';

class DioHandler {
  Dio? dio;

  DioHandler._internal() {
    if (dio != null) {
      return;
    }
    final options = BaseOptions(
      baseUrl: Env.baseURL,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 10),
    );
    dio = Dio(options);
  }

  factory DioHandler() => _singleton;
  static final DioHandler _singleton = DioHandler._internal();
}
