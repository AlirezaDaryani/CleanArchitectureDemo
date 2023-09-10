import 'package:CreativeFabrica/core/errors/failure.dart';
import 'package:CreativeFabrica/features/home/data/data_sources/photos_datasource.dart';
import 'package:CreativeFabrica/features/home/domain/entities/photos_response.dart';
import 'package:CreativeFabrica/features/home/domain/repositories/photos_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/network_info.dart';

class PhotosRepositoryImpl implements PhotosRepository {
  final NetworkInfo networkInfo;
  final PhotosDataSource dataSource;

  PhotosRepositoryImpl({required this.networkInfo, required this.dataSource});

  @override
  Future<Either<Failure, PhotosResponse>> getPhotos() async {
    var value = await networkInfo.isConnected;
    if (value) {
      try {
        var response = await dataSource.getPhotos();

        ///it means data is right
        return Right(response);
      } on ServerException catch (e) {
        debugPrint(e.toString());
        return Left(APIFailure(statusCode: e.statusCode));
      }
    } else {
      return const Left(InternetFailure());
    }
  }
}
