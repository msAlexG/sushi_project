// To parse this JSON data, do
//
//     final catalog = catalogFromJson(jsonString);

import 'dart:convert';

CatalogModel catalogFromJson(String str) =>
    CatalogModel.fromJson(json.decode(str));

String catalogToJson(CatalogModel data) => json.encode(data.toJson());

class CatalogModel {
  List<Category> category;

  CatalogModel({
    required this.category,
  });

  factory CatalogModel.fromJson(Map<String, dynamic> json) => CatalogModel(
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
      };
}

class Category {
  String name;
  String id;
  int number;
  List<Product> products;

  Category({
    required this.name,
    required this.id,
    required this.number,
    required this.products,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        id: json[" id"],
        number: json["number"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        " id": id,
        "number": number,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'Category(name: $name, id: $id, number: $number, products: $products)';
  }
}

class Product {
  String name;
  String description;
  String img;
  String price;
  String weight;
  String categoryId;
  String number;
  List<Addition> productSous;
  List<Addition> flovour;
  List<Addition> feature;
  List<Addition> size;
  List<Addition> addition;

  Product({
    required this.name,
    required this.description,
    required this.img,
    required this.price,
    required this.weight,
    required this.categoryId,
    required this.number,
    required this.productSous,
    required this.flovour,
    required this.feature,
    required this.size,
    required this.addition,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        description: json["description"],
        img: json["img"],
        price: json["price"],
        weight: json["weight"],
        categoryId: json["category_id"],
        number: json["number"],
        productSous: List<Addition>.from(
            json["product_sous"].map((x) => Addition.fromJson(x))),
        flovour: List<Addition>.from(
            json["flovour"].map((x) => Addition.fromJson(x))),
        feature: List<Addition>.from(
            json["feature"].map((x) => Addition.fromJson(x))),
        size:
            List<Addition>.from(json["size"].map((x) => Addition.fromJson(x))),
        addition: List<Addition>.from(
            json["addition"].map((x) => Addition.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "img": img,
        "price": price,
        "weight": weight,
        "category_id": categoryId,
        "number": number,
        "product_sous": List<dynamic>.from(productSous.map((x) => x.toJson())),
        "flovour": List<dynamic>.from(flovour.map((x) => x.toJson())),
        "feature": List<dynamic>.from(feature.map((x) => x.toJson())),
        "size": List<dynamic>.from(size.map((x) => x.toJson())),
        "addition": List<dynamic>.from(addition.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'Product(name: $name, description: $description, img: $img, price: $price, weight: $weight, categoryId: $categoryId, number: $number, productSous: $productSous, flovour: $flovour, feature: $feature, size: $size, addition: $addition)';
  }
}

class Addition {
  String id;
  String name;
  String description;
  String? number;

  Addition({
    required this.id,
    required this.name,
    required this.description,
    this.number,
  });

  factory Addition.fromJson(Map<String, dynamic> json) => Addition(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "number": number,
      };
}
