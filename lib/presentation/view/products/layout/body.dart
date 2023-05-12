import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:single_vender_ecommerce/applications/cart_provider.dart';
import 'package:single_vender_ecommerce/applications/user_provider.dart';
import 'package:single_vender_ecommerce/infrastructure/models/comments.dart';
import 'package:single_vender_ecommerce/infrastructure/services/cart.dart';
import 'package:single_vender_ecommerce/infrastructure/services/comments.dart';
import 'package:single_vender_ecommerce/infrastructure/services/product.dart';
import 'package:single_vender_ecommerce/presentation/elements/app_button.dart';
import 'package:single_vender_ecommerce/presentation/elements/custom_text.dart';
import 'package:single_vender_ecommerce/presentation/view/cart/cart_view.dart';
import '../../../../infrastructure/models/cart.dart';
import '../../../../infrastructure/models/product.dart';
import '../../../elements/app_textfield.dart';
import '../product_details.dart';

class ProductBody extends StatelessWidget {
  ProductBody({Key? key}) : super(key: key);
  final ProductServices _productServices = ProductServices();
  final CartServices _cartServices = CartServices();
  final CommentsServices _commentsServices=CommentsServices();
  final TextEditingController _commentsController = TextEditingController();
  int quantity = 1;
 double rating=1;
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);

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
                value: _productServices.fetchProduct(),
                initialData: [ProductModel()],
                builder: (context, child) {
                  List<ProductModel> productList =
                      context.watch<List<ProductModel>>();
                  return productList.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
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
                                              ProductDetailsView(
                                                productModel: productList[i],
                                              )));
                                },
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Column(
                                      crossAxisAlignment:CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                    height: 80,
                                                    width: 80,
                                                    child: Image.network(
                                                        productList[i]
                                                            .productImage
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
                                                          .productName
                                                          .toString(),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                    CustomText(
                                                      text: productList[i]
                                                          .productDescription
                                                          .toString(),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    CustomText(
                                                      text: productList[i]
                                                          .productPrice
                                                          .toString(),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),

                                                  ],
                                                ),
                                              ],
                                            ),
                                            //In cart we pass 2 user Ids one for first approach and 2nd id my cart approach
                                            IconButton(
                                                onPressed: () {
                                                  _cartServices
                                                      .addToCart(
                                                    BuildContext,
                                                    cartModel: CartModel(
                                                        productDetails:
                                                            productList[i],
                                                        quantity: quantity,
                                                        totalPrice:
                                                            productList[i]
                                                                .productPrice,
                                                        sortTime: DateTime.now()
                                                            .millisecond
                                                            .toString(),
                                                        uId: userProvider
                                                            .getUserData.docId
                                                            .toString()),
                                                    uid: userProvider
                                                        .getUserData.docId
                                                        .toString(),
                                                  )
                                                      .then((value) {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const CartView()));
                                                  });
                                                },
                                                icon: const Icon(Icons.add))
                                          ],
                                        ),
                                        RatingBarIndicator(
                                          rating: rating,
                                          itemBuilder: (context, index) => const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 30.0,
                                          direction: Axis.horizontal,
                                        ),
                                        const SizedBox(height:8,),
                                        AppTextField(
                                          text: 'Add comments',
                                          keyBoardType: TextInputType.text,
                                          controller: _commentsController,
                                          maxLines:3,
                                        ),

                                        const SizedBox(height:8,),
                                        AppButton(onPressed: (){
                                        _commentsServices.addComments(CommentsModel(
                                          productId:productList[i].productId,
                                          userId:userProvider.getUserData.docId,
                                          comment:_commentsController.text,
                                          time:Timestamp.fromDate(DateTime.now())
                                        ));
                                        }, btnLabel:"Add Comment",height:38,width:200,),
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
