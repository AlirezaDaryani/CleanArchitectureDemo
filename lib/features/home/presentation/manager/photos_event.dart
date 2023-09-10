part of 'photos_bloc.dart';

@immutable
abstract class PhotosEvent {}

class RetryPhotoEvent extends PhotosEvent {}

class PhotosInitialEvent extends PhotosEvent {}
