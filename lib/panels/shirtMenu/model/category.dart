import 'dart:convert';
import 'package:equatable/equatable.dart';

List<CategoryModel> CategoryFromJson(String str) => List<CategoryModel>.from(
    json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryToJson(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel extends Equatable {
  final String id;
  final String name;
  final String number;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.number,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "number": number,
      };

  @override
  // TODO: implement props

  List<Object?> get props => [id, name, number];
}
