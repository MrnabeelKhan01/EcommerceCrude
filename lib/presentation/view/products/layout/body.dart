import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:single_vender_ecommerce/infrastructure/services/product.dart';
import 'package:single_vender_ecommerce/presentation/elements/app_button.dart';
import 'package:single_vender_ecommerce/presentation/elements/custom_text.dart';

import '../../../../infrastructure/models/product.dart';
import '../product_details.dart';
import '../update_product.dart';

class ProductBody extends StatelessWidget {
  ProductBody({Key? key}) : super(key: key);
  final ProductServices _productServices = ProductServices();
  ProductModel productModel = ProductModel();

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
                value: _productServices
                    .fetchProduct(productModel.productId.toString()),
                initialData: [ProductModel()],
                builder: (context, child) {
                  List<ProductModel> productList =
                      context.watch<List<ProductModel>>();
                  return productList.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics:const NeverScrollableScrollPhysics(),
                          itemCount: productList.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                               ProductDetailsView(productModel:productList[i],)));
                                },
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                                height: 80,
                                                width: 80,
                                                child: Image.network(
                                                    productList[i]
                                                        .image
                                                        .toString())),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomText(
                                                  text: productList[i]
                                                      .name
                                                      .toString(),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                                CustomText(
                                                  text: productList[i]
                                                      .price
                                                      .toString(),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  _productServices
                                                      .deleteProduct(
                                                          productList[i]
                                                              .productId
                                                              .toString());
                                                },
                                                icon: const Icon(
                                                  Icons.delete_outline,
                                                  color: Colors.red,
                                                )),
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              UpdateProduct(
                                                                productModel:
                                                                    productList[
                                                                        i],
                                                              )));
                                                },
                                                icon: const Icon(Icons.edit))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })
                      : const Text("Not working");
                },
              ),
              const SizedBox(
                height: 34,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
