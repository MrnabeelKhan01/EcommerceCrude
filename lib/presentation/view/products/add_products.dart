import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:single_vender_ecommerce/infrastructure/models/product.dart';
import 'package:single_vender_ecommerce/infrastructure/services/product.dart';
import 'package:single_vender_ecommerce/presentation/elements/app_button.dart';
import 'package:single_vender_ecommerce/presentation/view/bottom_nav_bar/bottom_navbar.dart';

import '../../../applications/upload_file.dart';
import '../../../configurations/frontend_configs.dart';
import '../../elements/app_textfield.dart';
import '../../elements/custom_appbar.dart';

class AddProductsView extends StatefulWidget {
  const AddProductsView({Key? key}) : super(key: key);

  @override
  State<AddProductsView> createState() => _AddProductsViewState();
}

class _AddProductsViewState extends State<AddProductsView> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _priceController = TextEditingController();
  ProductModel productModel = ProductModel();
  final ProductServices _productServices = ProductServices();
  File? myImage;

  final ImagePicker _picker = ImagePicker();

  Future pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    final temporaryImage = File(image!.path);
    setState(() {
      myImage = temporaryImage;
    });
  }

  bool isLoading = false;
  // double rating ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: isLoading
          ? SizedBox(
              height: 45,
              width: 45,
              child: CircularProgressIndicator(
                color: FrontendConfigs.kPrimaryColor,
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    Text(
                      'Add product',
                      style: FrontendConfigs.kSubHeadingStyle,
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    AppTextField(
                        text: 'Name of product',
                        keyBoardType: TextInputType.text,
                        controller: _nameController),
                    const SizedBox(
                      height: 18,
                    ),
                    AppTextField(
                        text: 'price of product',
                        keyBoardType: TextInputType.number,
                        controller: _priceController),
                    const SizedBox(
                      height: 24,
                    ),
                    InkWell(
                      onTap: () {
                        pickImage();
                      },
                      child: myImage != null
                          ? Image.file(myImage!)
                          : SizedBox(
                              height: 280,
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset(
                                  'assets/images/adidas_shoes.png')),
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    // RatingBarIndicator(
                    //   rating: double.parse(
                    //       productModel.rating.toString()),
                    //   itemBuilder: (context, index) => const Icon(
                    //     Icons.star,
                    //     color: Colors.amber,
                    //   ),
                    //   itemCount: 5,
                    //   itemSize: 30.0,
                    //   direction: Axis.horizontal,
                    // ),
                    const SizedBox(
                      height: 18,
                    ),
                    AppButton(
                        onPressed: () {
                          UploadFileServices()
                              .getUrl(
                            context,
                            file: myImage!,
                          )
                              .then((value) {
                                setState(() {
                                  isLoading=true;
                                });
                            _productServices.createProduct(ProductModel(
                                name: _nameController.text,
                                price: _priceController.text,
                                image: value));
                          }).then((value) {
                            setState(() {
                              isLoading = false;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const BottomBarView()));
                          });
                        },
                        btnLabel: 'Add Product')
                  ],
                ),
              ),
            ),
    );
  }

}
