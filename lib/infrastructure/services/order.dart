import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:single_vender_ecommerce/infrastructure/models/order.dart';

class OrderServices {
  //place order
  Future placeOrder(OrderModel orderModel) async {
    DocumentReference df =
        FirebaseFirestore.instance.collection("orderCollection").doc();
    return await df.set(orderModel.toJson(
        userID: orderModel.user!.docId.toString(), orderID: df.id.toString()));
  }

  //Get myOrder
  Stream<List<OrderModel>> streamMyOrder(String myId) {
    print(myId);
    return FirebaseFirestore.instance
        .collection("orderCollection")
        .where('user.docId', isEqualTo: myId)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => OrderModel.fromJson(e.data())).toList());
  }
}
