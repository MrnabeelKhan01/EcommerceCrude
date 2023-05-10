import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:single_vender_ecommerce/infrastructure/models/product.dart';

class ProductServices {
  Stream<List<ProductModel>> fetchProduct() {
    return FirebaseFirestore.instance
        .collection("productCollection")
        .snapshots()
        .map((list) =>
            list.docs.map((e) => ProductModel.fromJson(e.data())).toList());
  }
}
