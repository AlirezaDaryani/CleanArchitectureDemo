import 'package:CreativeFabrica/core/network/dio.dart';
import 'package:CreativeFabrica/core/utils/env.dart';
import 'package:CreativeFabrica/features/home/data/models/photos_response_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/exceptions.dart';

abstract class PhotosDataSource {
  Future<PhotosResponseModel> getPhotos();
}

class PhotosDataSourceImpl implements PhotosDataSource {
  final DioHandler dioHandler;

  PhotosDataSourceImpl({required this.dioHandler});

  @override
  Future<PhotosResponseModel> getPhotos() async {
    try {
      final response = await dioHandler.dio!.get(
          '/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=${Env.apiKey}');
      debugPrint(response.toString());
      if (response.statusCode == 200 && response.data != null) {
        return PhotosResponseModel.fromJson(response.data);
      } else {
        throw ServerException(statusCode: 501, error: 'Data is not available!');
      }
    } catch (e, t) {
      debugPrint(e.toString());
      debugPrint(t.toString());
      throw ServerException(statusCode: 504, error: "Something went wrong!");
    }
  }
}
