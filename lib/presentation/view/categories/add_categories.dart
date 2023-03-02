import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:single_vender_ecommerce/infrastructure/models/category.dart';
import 'package:single_vender_ecommerce/infrastructure/models/product.dart';
import 'package:single_vender_ecommerce/infrastructure/services/category.dart';
import 'package:single_vender_ecommerce/infrastructure/services/product.dart';
import 'package:single_vender_ecommerce/presentation/elements/app_button.dart';

import '../../../applications/upload_file.dart';
import '../../../configurations/frontend_configs.dart';
import '../../elements/app_textfield.dart';
import '../../elements/custom_appbar.dart';

class AddCategoryView extends StatefulWidget {
  const AddCategoryView({Key? key}) : super(key: key);

  @override
  State<AddCategoryView> createState() => _AddCategoryViewState();
}

class _AddCategoryViewState extends State<AddCategoryView> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _priceController = TextEditingController();

  final CategoryServices _categoryServices = CategoryServices();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: isLoading
          ?  SizedBox(
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
                'Add Category',
                style: FrontendConfigs.kSubHeadingStyle,
              ),
              const SizedBox(
                height: 34,
              ),
              AppTextField(
                  text: 'Name of Category',
                  keyBoardType: TextInputType.text,
                  controller: _nameController),
              const SizedBox(
                height: 18,
              ),
              AppTextField(
                  text: 'Category Type',
                  keyBoardType: TextInputType.text,
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
              RatingBar.builder(
                initialRating: 3,
                itemSize: 30,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
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
                          _categoryServices.createCategory(CategoryModel(
                            name:_nameController.text,
                            categoryType:_priceController.text,
                            image:value
                          ));
                    });
                    setState(() {
                      isLoading=false;
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
