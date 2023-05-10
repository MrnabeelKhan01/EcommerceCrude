
import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

class CategoryModel {
  CategoryModel({
    this.categoryName,
    this.categoryImage,
    this.categoryDescription,
    this.categoryId,
  });

  String? categoryName;
  String? categoryImage;
  String? categoryDescription;
  String? categoryId;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    categoryName: json["categoryName"],
    categoryImage: json["categoryImage"],
    categoryDescription: json["categoryDescription"],
        categoryId: json["categoryId"],
      );

  Map<String, dynamic> toJson() => {
        "categoryName": categoryName,
        "categoryImage": categoryImage,
        "categoryDescription": categoryDescription,
        "categoryId": categoryId,
      };
}
