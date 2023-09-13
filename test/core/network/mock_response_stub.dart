import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';

import '../../features/home/data/data_sources/photos_datasource_test.mocks.dart';

extension MockStub on MockHttpClientAdapter {
  void createMockResponseStub(String body, int statusCode) {
    final response = ResponseBody.fromString(
      body,
      statusCode,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );

    when(fetch(any, any, any)).thenAnswer(
      (_) async {
        return response;
      },
    );
  }
}
