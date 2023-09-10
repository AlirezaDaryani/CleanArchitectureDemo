import 'package:equatable/equatable.dart';

class PhotosResponse extends Equatable {
  final List<PhotoResponse>? photos;

  const PhotosResponse({
    this.photos,
  });

  @override
  List<Object?> get props => [photos];
}

class PhotoResponse extends Equatable {
  final int? id;
  final int? sol;
  final PhotoCameraResponse? camera;
  final String? imgSrc;
  final DateTime? earthDate;
  final RoverResponse? rover;

  const PhotoResponse({
    this.id,
    this.sol,
    this.camera,
    this.imgSrc,
    this.earthDate,
    this.rover,
  });

  @override
  List<Object?> get props => [id, sol, camera, imgSrc, earthDate, rover];
}

class PhotoCameraResponse extends Equatable {
  final int? id;
  final String? name;
  final int? roverId;
  final String? fullName;

  const PhotoCameraResponse({
    this.id,
    this.name,
    this.roverId,
    this.fullName,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        roverId,
        fullName,
      ];
}

class RoverResponse extends Equatable {
  final int? id;
  final String? name;
  final DateTime? landingDate;
  final DateTime? launchDate;
  final String? status;
  final int? maxSol;
  final DateTime? maxDate;
  final int? totalPhotos;
  final List<CameraElementResponse>? cameras;

  const RoverResponse({
    this.id,
    this.name,
    this.landingDate,
    this.launchDate,
    this.status,
    this.maxSol,
    this.maxDate,
    this.totalPhotos,
    this.cameras,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        landingDate,
        launchDate,
        status,
        maxSol,
        maxDate,
        totalPhotos,
        cameras
      ];
}

class CameraElementResponse extends Equatable {
  final String? name;
  final String? fullName;

  const CameraElementResponse({
    this.name,
    this.fullName,
  });

  @override
  List<Object?> get props => [
        name,
        fullName,
      ];
}
