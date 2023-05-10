import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:single_vender_ecommerce/infrastructure/models/category.dart';

class CategoryServices {
  Future createCategory(CategoryModel categoryModel) async {
    return await FirebaseFirestore.instance
        .collection("categoryCollection")
        .doc(categoryModel.categoryId)
        .set(categoryModel.toJson());
  }

  Future updateCategory(CategoryModel categoryModel) async {
    return await FirebaseFirestore.instance
        .collection("categoryCollection")
        .doc(categoryModel.categoryId)
        .update({
      "name": categoryModel.categoryName,
      "image": categoryModel.categoryImage,
      "categoryType": categoryModel.categoryDescription
    });
  }

  Future deleteCategory(String categoryId) async {
    return await FirebaseFirestore.instance
        .collection("categoryCollection")
        .doc(categoryId)
        .delete();
  }

  Stream<List<CategoryModel>> streamCategory(String categoryId) {
    return FirebaseFirestore.instance
        .collection("categoryCollection")
        .snapshots()
        .map((list) =>
            list.docs.map((e) => CategoryModel.fromJson(e.data())).toList());
  }
}
