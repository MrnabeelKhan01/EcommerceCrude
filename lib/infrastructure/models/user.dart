import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

class UserModel {
  UserModel({
     this.name,
     this.email,
     this.phoneNumber,
     this.address,
     this.docId,
     this.profileImage,
  });

  String ?name;
  String ?email;
  String ?phoneNumber;
  String ?profileImage;
  String ?address;
  String ?docId;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
    profileImage: json["profileImage"],
        address: json["address"],
        docId: json["docId"],
      );

  Map<String, dynamic> toJson(String docId) => {
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "address": address,
        "profileImage": profileImage,
        "docId": docId,
      };
}
