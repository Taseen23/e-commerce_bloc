// To parse this JSON data, do
//
//     final proModel = proModelFromJson(jsonString);

import 'dart:convert';

ProModel proModelFromJson(String str) => ProModel.fromJson(json.decode(str));

String proModelToJson(ProModel data) => json.encode(data.toJson());

class ProModel {
  final String? title;
  final String? description;
  final String? price;

  ProModel({
    this.title,
    this.description,
    this.price,
  });

  factory ProModel.fromJson(Map<String, dynamic> json) => ProModel(
        title: json["title"],
        description: json["description"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "price": price,
      };
}
