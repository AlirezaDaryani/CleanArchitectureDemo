part of 'photos_bloc.dart';

@immutable
abstract class PhotosState extends Equatable {
  @override
  List<Object> get props => [];
}

class PhotosInitialState extends PhotosState {}

class PhotosOpenState extends PhotosState {
  final PhotoResponse photo;

  PhotosOpenState({required this.photo});
}

class PhotosInternetErrorState extends PhotosState {
  final String message;

  PhotosInternetErrorState({
    required this.message,
  });
}

class PhotosServerErrorState extends PhotosState {
  final String message;
  final int statusCode;

  PhotosServerErrorState({required this.message, required this.statusCode});
}

class PhotosResponseState extends PhotosState {
  final PhotosResponse photosResponse;

  PhotosResponseState({required this.photosResponse});
}
