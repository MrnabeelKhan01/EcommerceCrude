
import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

class ProductModel {
  ProductModel({
    this.productName,
    this.productDescription,
    this.productPrice,
    this.productRating,
    this.productImage,
    this.productId,
    this.categoryId,
  });

  String ?productName;
  String ?productDescription;
  num ?productPrice;
  num ?productRating;
  String ?productImage;
  String ?productId;
  String ?categoryId;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    productName: json["productName"],
    productDescription: json["productDescription"],
    productPrice: json["productPrice"],
    productRating: json["productRating"],
    productImage: json["productImage"],
    productId: json["productID"],
    categoryId: json["categoryID"],
  );

  Map<String, dynamic> toJson(String productId) => {
    "productName": productName,
    "productDescription": productDescription,
    "productPrice": productPrice,
    "productRating": 0,
    "productImage": productImage,
    "productID": productId,
    "categoryID": categoryId,
  };
}
