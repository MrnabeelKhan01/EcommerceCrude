import 'package:flutter/material.dart';
import 'package:single_vender_ecommerce/infrastructure/models/product.dart';
import 'package:single_vender_ecommerce/presentation/elements/custom_appbar.dart';
import 'package:single_vender_ecommerce/presentation/elements/custom_text.dart';

class ProductDetailsView extends StatelessWidget {
  ProductDetailsView({Key? key, required this.productModel}) : super(key: key);
  ProductModel productModel = ProductModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, text: "Product Details", showText: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                const SizedBox(height:18,),
                SizedBox(
                    height:300,
                    width:MediaQuery.of(context).size.width,
                    child: Image.network(productModel.image.toString())),
                const SizedBox(height:44,),
                CustomText(text: productModel.name.toString(),fontSize:16,fontWeight: FontWeight.w600,),
                CustomText(text: productModel.price.toString(),fontSize:16,fontWeight: FontWeight.w600,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
