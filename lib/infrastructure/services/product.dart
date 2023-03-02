import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:single_vender_ecommerce/infrastructure/models/product.dart';

class ProductServices {
  Future createProduct(ProductModel productModel) async {
    DocumentReference df =
        FirebaseFirestore.instance.collection('productCollection').doc();
    return await df.set(productModel.toJson(df.id));
  }

  Future updateProduct(ProductModel productModel) async {
    return FirebaseFirestore.instance
        .collection('productCollection')
        .doc(productModel.productId)
        .update({
      "image": productModel.image,
      "name": productModel.name,
      "price": productModel.price
    });
  }

  Future deleteProduct(String productId) async {
    return FirebaseFirestore.instance
        .collection('productCollection')
        .doc(productId)
        .delete();
  }

  Stream<List<ProductModel>> fetchProduct(String categoryId) {
    return FirebaseFirestore.instance
        .collection("productCollection")
        .snapshots()
        .map((list) =>
            list.docs.map((e) => ProductModel.fromJson(e.data())).toList());
  }
}
