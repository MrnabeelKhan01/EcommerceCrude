import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

class ProductModel {
  ProductModel({
    this.name,
    this.price,
    this.image,
    this.rating,
    this.productId,
    this.categoryId,
  });

  String? name;
  String? price;
  String? image;
  num? rating;
  String? productId;
  String? categoryId;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        name: json["name"],
        price: json["price"],
        image: json["image"],
        rating: json["rating"],
        productId: json["productId"],
        categoryId: json["categoryId"],
      );

  Map<String, dynamic> toJson(String productId) => {
        "name": name,
        "price": price,
        "image": image,
        "rating": 0,
        "productId": productId,
        "categoryId": categoryId,
      };
}
