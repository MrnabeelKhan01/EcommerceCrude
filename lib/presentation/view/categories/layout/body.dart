import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:single_vender_ecommerce/infrastructure/models/category.dart';
import 'package:single_vender_ecommerce/infrastructure/services/category.dart';
import 'package:single_vender_ecommerce/presentation/elements/custom_text.dart';

class CategoryBody extends StatelessWidget {
  CategoryBody({Key? key}) : super(key: key);
  CategoryModel categoryModel = CategoryModel();
  final CategoryServices _categoryServices = CategoryServices();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 18,
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
                                              categoryList[i].image.toString())),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text:
                                                categoryList[i].name.toString(),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800,
                                          ),
                                          CustomText(
                                            text:
                                                categoryList[i].categoryType.toString(),
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
