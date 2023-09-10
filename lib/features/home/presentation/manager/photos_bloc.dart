import 'package:CreativeFabrica/features/home/domain/entities/photos_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/use_cases/photos_usecase.dart';

part 'photos_event.dart';

part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  final PhotosUseCase useCase;

  PhotosBloc({required this.useCase}) : super(PhotosInitialState()) {
    on<PhotosEvent>((event, emit) async {
      switch (event.runtimeType) {
        case PhotosInitialEvent:
          final either = await useCase(NoParams());
          either.fold((l) => handleFailure(l, emit),
              (r) => emit(PhotosResponseState(photosResponse: r)));
          break;
        case RetryPhotoEvent:
          final either = await useCase(NoParams());
          either.fold((l) => handleFailure(l, emit), (r) {
            if (r.photos == null) {
              emit(PhotosServerErrorState(
                  message: 'No Data found!', statusCode: 404));
            } else {
              emit(PhotosResponseState(photosResponse: r));
            }
          });
          break;
      }
    });
  }

  handleFailure(Failure l, Emitter<PhotosState> emit) {
    switch (l.runtimeType) {
      case APIFailure:
        emit(PhotosServerErrorState(
            message: (l as APIFailure).message, statusCode: l.statusCode));
        break;
      case InternetFailure:
        emit(PhotosInternetErrorState(
          message: (l as InternetFailure).message,
        ));
        break;
    }
  }
}
