import 'package:CreativeFabrica/core/network/dio.dart';
import 'package:CreativeFabrica/features/home/data/data_sources/photos_datasource.dart';
import 'package:CreativeFabrica/features/home/data/models/photos_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/fixtures/fixture_reader.dart';
import '../../../../core/network/mock_response_stub.dart';
import 'photos_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<DioHandler>(), MockSpec<HttpClientAdapter>()])
void main() {
  late MockHttpClientAdapter adapter;
  late PhotosDataSourceImpl dataSourceImpl;
  late MockDioHandler dioHandler;

  setUp(() {
    adapter = MockHttpClientAdapter();
    dioHandler = MockDioHandler();
    dataSourceImpl = PhotosDataSourceImpl(dioHandler: dioHandler);
  });

  group('get photos', () {
    final sampleModel = PhotosResponseModel(photos: [
      Photo(
        id: 102693,
        sol: 1000,
        imgSrc:
            "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/fcam/FLB_486265257EDR_F0481570FHAZ00323M_.JPG",
        earthDate: DateTime(2015, 5, 30),
        camera: const PhotoCamera(
          id: 20,
          name: "FHAZ",
          fullName: "Front Hazard Avoidance Camera",
          roverId: 5,
        ),
        rover: Rover(
          name: "Curiosity",
          id: 5,
          cameras: const [
            CameraElement(
              name: "FHAZ",
              fullName: "Front Hazard Avoidance Camera",
            )
          ],
          landingDate: DateTime(2012, 8, 6),
          launchDate: DateTime(2011, 11, 26),
          maxDate: DateTime(2023, 09, 08),
          maxSol: 3942,
          status: "active",
          totalPhotos: 677361,
        ),
      )
    ]);
    final jsonData = fixture('photos.json');

    test(
      'Get model from response',
      () async {
        when(dioHandler.dio).thenReturn(Dio()..httpClientAdapter = adapter);
        adapter.createMockResponseStub(jsonData, 200);

        var result = await dataSourceImpl.getPhotos();

        expect(result, equals(sampleModel));
      },
    );
  });
}
