import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:single_vender_ecommerce/applications/user_provider.dart';
import 'package:single_vender_ecommerce/infrastructure/models/cart.dart';

class CartServices {
  //Stream products
  Stream<List<CartModel>> cartStream(BuildContext, context) {
    var user = Provider.of<UserProvider>(context, listen: false);
    return FirebaseFirestore.instance
        .collection("cartCollection")
        .doc(user.getUserData.docId)
        .collection("myCart")
        .snapshots()
        .map((event) =>
            event.docs.map((e) => CartModel.fromJson(e.data()!)).toList());
  }

//add to cart
  Future<void> addToCart(BuildContext,
      {required CartModel cartModel, required String uid}) async {
    DocumentReference df = FirebaseFirestore.instance
        .collection("cartCollection")
        .doc(uid)
        .collection("myCart")
        .doc();
    df.set(cartModel.toJson(df.id));
  }

// remove from cart
  Future<void> removeFromCart(BuildContext,
      {required String docId, required String uid}) async {
    return FirebaseFirestore.instance
        .collection('cartCollection')
        .doc(uid)
        .collection("myCart")
        .doc(docId)
        .delete();
  }

//increment quantity
  Future<void> incrementProductQuantity(
      {required num updatePrice,
      required String uid,
      required String docID}) async {

    return FirebaseFirestore.instance
        .collection("cartCollection")
        .doc(uid)
        .collection("myCart")
        .doc(docID)
        .update({
      "quantity": FieldValue.increment(1),
      "totalPrice": FieldValue.increment(updatePrice),
    });
  }

  //decrement quantity
  Future<void> decrementProductQuantity(
      {required num updatePrice,
      required String uid,
      required String docId}) async {
    print(docId);
    return FirebaseFirestore.instance
        .collection('cartCollection')
        .doc(uid)
        .collection("myCart")
        .doc(docId)
        .update({
      "quantity": FieldValue.increment(-1),
      "totalPrice": FieldValue.increment(-updatePrice)
    });
  }

  Stream<List<CartModel>> streamSpecificProduct(String productId, String uid) {
    return FirebaseFirestore.instance
        .collection("cartCollection")
        .doc(uid)
        .collection("myCart")
        .where('productDetails.productId', isEqualTo: productId)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => CartModel.fromJson(e.data())).toList());
  }
  Future<void> emptyMyCart(
      {required String docID, required String userID}) async {
    print("User ID : $userID");
    return FirebaseFirestore.instance
        .collection('cartCollection')
        .doc(userID)
        .collection('myCart')
        .doc(docID)
        .delete();
  }

}
