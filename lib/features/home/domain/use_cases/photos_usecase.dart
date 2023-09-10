import 'package:CreativeFabrica/core/errors/failure.dart';
import 'package:CreativeFabrica/features/home/domain/entities/photos_response.dart';
import 'package:CreativeFabrica/features/home/domain/repositories/photos_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';

class PhotosUseCase implements UseCase<PhotosResponse, NoParams> {
  final PhotosRepository repository;

  PhotosUseCase(this.repository);

  @override
  Future<Either<Failure, PhotosResponse>> call(NoParams params) async {
    return await repository.getPhotos();
  }
}
