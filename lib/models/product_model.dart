import 'package:flutter/foundation.dart';

class Product {
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.stockQuantity,
    required this.price,
    required this.categoryId,
    required this.categoryName,
    required this.categoryDescription,
    required this.imagePath,
  });
  int id;
  String name;
  String description;
  int stockQuantity;
  double price;
  int categoryId;
  String categoryName;
  String categoryDescription;
  String imagePath;
}

class ProductModel {
  ProductModel({required this.resualt});
  final List<Product> resualt;
  factory ProductModel.fromJson(List<dynamic> json) {
    List<Product> resualt = json.map((m){
      return Product(
        id: m['id'],
          name: m["name"],
          description: m["description"],
          stockQuantity: m["stockQuantity"],
          price: m["price"],
          categoryId: m["categoryId"],
          categoryName: m["category"]["name"],
          categoryDescription: m["category"]["description"],
          imagePath: m["imagePath"],
        );
    }).toList();
    return ProductModel(resualt: resualt);
}
}