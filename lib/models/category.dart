import 'dart:convert';

List<Category> categoriesFromJson(String str) {
  return List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));
}

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
    int id;
    String name;
    String slug;
    String image;
    DateTime creationAt;
    DateTime updatedAt;

    Category({
        required this.id,
        required this.name,
        required this.slug,
        required this.image,
        required this.creationAt,
        required this.updatedAt,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}