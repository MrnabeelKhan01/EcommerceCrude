
import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

class CategoryModel {
  CategoryModel({
    this.name,
    this.image,
    this.categoryType,
    this.categoryId,
  });

  String? name;
  String? image;
  String? categoryType;
  String? categoryId;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        name: json["name"],
        image: json["image"],
        categoryType: json["categoryType"],
        categoryId: json["categoryId"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "categoryType": categoryType,
        "categoryId": categoryId,
      };
}
