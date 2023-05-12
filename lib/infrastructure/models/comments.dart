// To parse this JSON data, do
//
//     final comments = commentsFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

CommentsModel commentsFromJson(String str) => CommentsModel.fromJson(json.decode(str));


class CommentsModel {
  String ?docId;
  String ?productId;
  String ?userId;
  String ?comment;
  Timestamp ?time;

  CommentsModel({
     this.docId,
     this.productId,
     this.userId,
     this.comment,
     this.time,
  });

  factory CommentsModel.fromJson(Map<String, dynamic> json) => CommentsModel(
    docId: json["docId"],
    productId: json["productId"],
    userId: json["userId"],
    comment: json["comment"],
    time: json["time"],
  );

  Map<String, dynamic> toJson(String docId) => {
    "docId": docId,
    "productId": productId,
    "userId": userId,
    "comment": comment,
    "time": time,
  };
}
