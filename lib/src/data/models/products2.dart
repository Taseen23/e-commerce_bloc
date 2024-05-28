// To parse this JSON data, do
//
//     final imageModel = imageModelFromJson(jsonString);

import 'dart:convert';

ImageModel imageModelFromJson(String str) =>
    ImageModel.fromJson(json.decode(str));

String imageModelToJson(ImageModel data) => json.encode(data.toJson());

class ImageModel {
  final String? image;

  ImageModel({
    this.image,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
      };
}
