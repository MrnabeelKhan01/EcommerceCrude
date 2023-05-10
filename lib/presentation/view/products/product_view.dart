import 'package:flutter/material.dart';
import 'package:single_vender_ecommerce/presentation/elements/custom_text.dart';
import 'package:single_vender_ecommerce/presentation/view/products/layout/body.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(
          text: 'Products',
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: ProductBody(),
    );
  }
}
