// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

import 'package:single_vender_ecommerce/infrastructure/models/cart.dart';
import 'package:single_vender_ecommerce/infrastructure/models/user.dart';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));



class OrderModel {
  OrderModel({
    this.orderId,
    this.cart,
    this.user,
    this.isProcessedDate,
    this.isCompletedDate,
    this.isPendingDate,
    this.isCanceledDate,
    this.isProcessed,
    this.isPending,
    this.isCompleted,
    this.totalBill,
  });

  String ?orderId;
   List<CartModel> ?cart;
  UserModel ?user;
  String ?isProcessedDate;
  String ?isCompletedDate;
  String ?isPendingDate;
  String ?isCanceledDate;
  String ?isProcessed;
  String ?isPending;
  String ?isCompleted;
  String ?totalBill;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    orderId: json["orderId"],
    cart: json["cart"],
    user: json["user"],
    isProcessedDate: json["isProcessedDate"],
    isCompletedDate: json["isCompletedDate"],
    isPendingDate: json["isPendingDate"],
    isCanceledDate: json["isCanceledDate"],
    isProcessed: json["isProcessed"],
    isPending: json["isPending"],
    isCompleted: json["isCompleted"],
    totalBill: json["totalBill"],
  );

  Map<String, dynamic> toJson({required String docId, required String orderId}) => {
    "orderId": orderId,
    "cart": cart,
    "user": user,
    "isProcessedDate": isProcessedDate,
    "isCompletedDate": isCompletedDate,
    "isPendingDate": isPendingDate,
    "isCanceledDate": isCanceledDate,
    "isProcessed": isProcessed,
    "isPending": isPending,
    "isCompleted": isCompleted,
    "totalBill": totalBill,
  };
}
