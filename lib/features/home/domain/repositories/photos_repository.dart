import 'package:CreativeFabrica/features/home/domain/entities/photos_response.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class PhotosRepository {
  Future<Either<Failure, PhotosResponse>> getPhotos();
}
