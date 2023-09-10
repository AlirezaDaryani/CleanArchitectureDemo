import 'package:flutter/cupertino.dart';

class ServerException implements Exception {
  final int statusCode;
  final String error;

  ServerException({required this.statusCode, required this.error}) {
    debugPrint(statusCode.toString());
    debugPrint(error);
  }
}
