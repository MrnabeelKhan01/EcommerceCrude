import 'package:flutter/material.dart';
import 'package:single_vender_ecommerce/infrastructure/models/product.dart';
import 'package:single_vender_ecommerce/infrastructure/services/product.dart';
import 'package:single_vender_ecommerce/presentation/elements/app_button.dart';
import 'package:single_vender_ecommerce/presentation/elements/custom_appbar.dart';

import '../../../configurations/frontend_configs.dart';
import '../../elements/app_textfield.dart';

class UpdateProduct extends StatefulWidget {
  UpdateProduct({Key? key, required this.productModel}) : super(key: key);
  ProductModel productModel = ProductModel();

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  final ProductServices _productServices = ProductServices();
  TextEditingController _nameController = TextEditingController();

  TextEditingController _priceController = TextEditingController();

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.productModel.name);
    _priceController = TextEditingController(text: widget.productModel.price);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:18.0),
        child: Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            AppTextField(
                text: "Name",
                keyBoardType: TextInputType.text,
                controller: _nameController),
            const SizedBox(
              height: 18,
            ),
            AppTextField(
                text: "Name",
                keyBoardType: TextInputType.text,
                controller: _priceController),
            const SizedBox(
              height: 18,
            ),
            AppButton(
                onPressed: () {
                  _productServices
                      .updateProduct(ProductModel(
                          name: _nameController.text,
                          price: _priceController.text,
                          productId: widget.productModel.productId))
                      .then((value) {
                    Navigator.pop(context);
                  });
                },
                btnLabel: 'Updated')
          ],
        ),
      ),
    );
  }
}

