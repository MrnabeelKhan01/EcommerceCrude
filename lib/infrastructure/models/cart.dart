
import 'package:single_vender_ecommerce/infrastructure/models/product.dart';

class CartModel {
  CartModel({
    this.uId,
    this.quantity,
    this.totalPrice,
    this.sortTime,
    this.docId,
    this.productDetails,
  });

  String? uId;
  num? quantity;
  num? totalPrice;
  String? sortTime;
  String? docId;
  ProductModel? productDetails;

  CartModel.fromJson(Map<String, dynamic> json) {
    uId = json["uID"];
    quantity = json["quantity"];
    totalPrice = json["totalPrice"];
    sortTime = json["sortTime"];
    docId = json["docID"];
    productDetails = json["productDetails"] != null
        ? ProductModel.fromJson(json["productDetails"])
        : null;
  }

  Map<String, dynamic> toJson(String docID) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["uID"] = uId;
    data["quantity"] = quantity;
    data["totalPrice"] = totalPrice;
    data["sortTime"] = sortTime;
    data["docID"] = docId;
    if (productDetails != null) {
      data["productDetails"] =
          productDetails!.toJson(productDetails!.productId.toString());
    }
    return data;
  }
}
