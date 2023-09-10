import 'dart:convert';

import 'package:CreativeFabrica/features/home/domain/entities/photos_response.dart';

PhotosResponseModel photosResponseFromJson(String str) =>
    PhotosResponseModel.fromJson(json.decode(str));

class PhotosResponseModel extends PhotosResponse {
  const PhotosResponseModel({
    super.photos,
  });

  factory PhotosResponseModel.fromJson(Map<String, dynamic> json) =>
      PhotosResponseModel(
        photos: json["photos"] == null
            ? []
            : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
      );
}

class Photo extends PhotoResponse {
  const Photo({
    super.id,
    super.sol,
    super.camera,
    super.imgSrc,
    super.earthDate,
    super.rover,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        sol: json["sol"],
        camera: json["camera"] == null
            ? null
            : PhotoCamera.fromJson(json["camera"]),
        imgSrc: json["img_src"],
        earthDate: json["earth_date"] == null
            ? null
            : DateTime.parse(json["earth_date"]),
        rover: json["rover"] == null ? null : Rover.fromJson(json["rover"]),
      );
}

class PhotoCamera extends PhotoCameraResponse {
  const PhotoCamera({
    super.id,
    super.name,
    super.roverId,
    super.fullName,
  });

  factory PhotoCamera.fromJson(Map<String, dynamic> json) => PhotoCamera(
        id: json["id"],
        name: json["name"],
        roverId: json["rover_id"],
        fullName: json["full_name"],
      );
}

class Rover extends RoverResponse {
  const Rover({
    super.id,
    super.name,
    super.landingDate,
    super.launchDate,
    super.status,
    super.maxSol,
    super.maxDate,
    super.totalPhotos,
    super.cameras,
  });

  factory Rover.fromJson(Map<String, dynamic> json) => Rover(
        id: json["id"],
        name: json["name"],
        landingDate: json["landing_date"] == null
            ? null
            : DateTime.parse(json["landing_date"]),
        launchDate: json["launch_date"] == null
            ? null
            : DateTime.parse(json["launch_date"]),
        status: json["status"],
        maxSol: json["max_sol"],
        maxDate:
            json["max_date"] == null ? null : DateTime.parse(json["max_date"]),
        totalPhotos: json["total_photos"],
        cameras: json["cameras"] == null
            ? []
            : List<CameraElement>.from(
                json["cameras"]!.map((x) => CameraElement.fromJson(x))),
      );
}

class CameraElement extends CameraElementResponse {
  const CameraElement({
    super.name,
    super.fullName,
  });

  factory CameraElement.fromJson(Map<String, dynamic> json) => CameraElement(
        name: json["name"],
        fullName: json["full_name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "full_name": fullName,
      };
}
