import 'dart:convert';
import 'package:myapp/models/category.dart';

List<Product> productsFromJson(String str) {
  return List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));
}

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    int id;
    String title;
    String slug;
    int price;
    String description;
    Category category;
    List<String> images;
    DateTime creationAt;
    DateTime updatedAt;

    Product({
        required this.id,
        required this.title,
        required this.slug,
        required this.price,
        required this.description,
        required this.category,
        required this.images,
        required this.creationAt,
        required this.updatedAt,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        price: json["price"],
        description: json["description"],
        category: Category.fromJson(json["category"]),
        images: List<String>.from(json["images"].map((x) => x)),
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "price": price,
        "description": description,
        "category": category.toJson(),
        "images": List<dynamic>.from(images.map((x) => x)),
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}