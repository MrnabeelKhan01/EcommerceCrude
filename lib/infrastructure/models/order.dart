// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'cart.dart';
import 'user.dart';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson(
    userID: data.user!.docId.toString(), orderID: data.orderID.toString()));

class OrderModel {
  OrderModel({
    this.orderID,
    this.cart,
    this.user,
    this.isProcessed,
    this.placementDate,
    this.processedData,
    this.completedDate,
    this.cancelledDate,
    this.isCompleted,
    this.isPending,
    this.isCancelled,
    this.adminID,
    this.totalBill,
  });

  String? orderID;
  List<CartModel>? cart;
  UserModel? user;
  bool? isProcessed;
  bool? isPending;
  bool? isCompleted;
  num? totalBill;
  Timestamp? placementDate;
  Timestamp? processedData;
  Timestamp? completedDate;
  Timestamp? cancelledDate;
  bool? isCancelled;
  String? adminID;

  OrderModel.fromJson(Map<String, dynamic> json) {
    if (json['cart'] != null) {
      cart = <CartModel>[];
      json['cart'].forEach((v) {
        cart!.add(CartModel.fromJson(v));
      });
    }
    user = UserModel.fromJson(json["user"]);
    isProcessed = json["isProcessed"];
    orderID = json["orderID"];
    placementDate = json["placementDate"];
    isCompleted = json["isCompleted"];
    isPending = json["isPending"];
    isCancelled = json["isCancelled"];
    adminID = json["adminID"];
    processedData = json["processedData"];
    cancelledDate = json["cancelledDate"];
    completedDate = json["completedDate"];
    totalBill = json["totalBill"];
  }

  Map<String, dynamic> toJson(
      {required String userID, required String orderID}) {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cart != null) {
      data['cart'] =
          cart!.map((v) => v.toJson(v.docId.toString())).toList();
    }
    data["user"] = user!.toJson(userID);
    data["isProcessed"] = false;
    data["orderID"] = orderID;
    data["placementDate"] = Timestamp.fromDate(DateTime.now());
    data["processedData"] = Timestamp.fromDate(DateTime.now());
    data["completedDate"] = Timestamp.fromDate(DateTime.now());
    data["cancelledDate"] = Timestamp.fromDate(DateTime.now());
    data["adminID"] = adminID;
    data["totalBill"] = totalBill;
    data["isCompleted"] = false;
    data["isCancelled"] = false;
    data["isPending"] = true;

    return data;
  }
}