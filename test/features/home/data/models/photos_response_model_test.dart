import 'dart:convert';

import 'package:CreativeFabrica/features/home/data/models/photos_response_model.dart';
import 'package:CreativeFabrica/features/home/domain/entities/photos_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/fixtures/fixture_reader.dart';

void main() {
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

  test('should be a subclass of PhotosResponse entity', () async {
    //assert
    expect(sampleModel, isA<PhotosResponse>());
  });

  group('fromJson', () {
    test('should return a valid model from the json file', () async {
      //arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('photos.json'));
      //act
      final result = PhotosResponseModel.fromJson(jsonMap);
      //assert
      expect(result, equals(sampleModel));
    });
  });
}
