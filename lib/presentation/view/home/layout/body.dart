import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:single_vender_ecommerce/infrastructure/models/category.dart';
import 'package:single_vender_ecommerce/infrastructure/services/category.dart';
import 'package:single_vender_ecommerce/presentation/view/categories/category_view.dart';
import '../../../../infrastructure/models/product.dart';
import '../../../../infrastructure/services/product.dart';
import '../../../elements/custom_text.dart';

class HomeBody extends StatelessWidget {
  HomeBody({Key? key}) : super(key: key);
  final ProductServices _productServices = ProductServices();
  ProductModel productModel = ProductModel();
  CategoryModel categoryModel = CategoryModel();
  final CategoryServices _categoryServices = CategoryServices();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 24,
              ),
              StreamProvider.value(
                value: _productServices
                    .fetchProduct(),
                initialData: [ProductModel()],
                builder: (context, child) {
                  List<ProductModel> productList =
                      context.watch<List<ProductModel>>();
                  return productList.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: productList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                          height: 80,
                                          width: 80,
                                          child: Image.network(
                                              productList[i].productImage.toString())),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text:
                                                productList[i].productName.toString(),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800,
                                          ),
                                          CustomText(
                                            text:
                                                productList[i].productPrice.toString(),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          CustomText(
                                            text:
                                            productList[i].productDescription.toString(),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })
                      : const Text("Not working");
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Categories',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CategoryView()));
                      },
                      child: CustomText(
                        text: 'See all',
                      ))
                ],
              ),
              StreamProvider.value(
                value: _categoryServices
                    .streamCategory(categoryModel.categoryId.toString()),
                initialData: [CategoryModel()],
                builder: (context, child) {
                  List<CategoryModel> categoryList =
                  context.watch<List<CategoryModel>>();
                  return categoryList.isNotEmpty
                      ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: categoryList.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                      height: 80,
                                      width: 80,
                                      child: Image.network(
                                          categoryList[i].categoryImage.toString())),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text:
                                        categoryList[i].categoryName.toString(),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                      ),
                                      CustomText(
                                        text:
                                        categoryList[i].categoryDescription.toString(),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                      : const Text("Not working");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
