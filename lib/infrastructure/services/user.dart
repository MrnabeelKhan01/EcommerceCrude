import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';

class UserServices {
  Future createUser(UserModel userModel) async {
    return await FirebaseFirestore.instance
        .collection('userCollection')
        .doc(userModel.docId.toString())
        .set(userModel.toJson(userModel.docId.toString()));
  }

  Future updateUser(UserModel userModel) async {
    return FirebaseFirestore.instance
        .collection('userCollection')
        .doc(userModel.docId)
        .update({
      "name": userModel.name,
      "address": userModel.address,
      "phoneNumber": userModel.phoneNumber
    });
  }

  Stream<UserModel> streamUsers(String docId) {
    return FirebaseFirestore.instance
        .collection('userCollection')
        .doc(docId)
        .snapshots()
        .map((event) => UserModel.fromJson(event.data()!));
  }

  Future deleteUser(String docId) async {
    return await FirebaseFirestore.instance
        .collection("userCollection")
        .doc(docId)
        .delete();
  }
}
