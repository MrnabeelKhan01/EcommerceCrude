import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:single_vender_ecommerce/applications/cart_provider.dart';
import 'package:single_vender_ecommerce/applications/user_provider.dart';
import 'package:single_vender_ecommerce/infrastructure/models/cart.dart';
import 'package:single_vender_ecommerce/infrastructure/models/order.dart';
import 'package:single_vender_ecommerce/infrastructure/services/cart.dart';
import 'package:single_vender_ecommerce/infrastructure/services/order.dart';
import 'package:single_vender_ecommerce/presentation/elements/app_button.dart';
import 'package:single_vender_ecommerce/presentation/elements/custom_text.dart';
import 'package:single_vender_ecommerce/presentation/view/order/order_view.dart';

class CartBody extends StatefulWidget {
  const CartBody({Key? key}) : super(key: key);

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  final CartServices _cartServices = CartServices();

  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context, listen: false);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child:isLoading?const Center(
          child: SizedBox(
            height:50,
            width:50,
            child: CircularProgressIndicator(
              color:Colors.blue,
            ),
          ),
        ): SingleChildScrollView(
          child: Column(
            children: [
              StreamProvider.value(
                value: _cartServices.cartStream(BuildContext, context),
                initialData: [CartModel()],
                builder: (context, child) {
                  List<CartModel> cartList = context.watch<List<CartModel>>();
                  return ListView.builder(
                      itemCount: cartList.length,
                      shrinkWrap: true,
                      physics:NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        return cartList.isNotEmpty
                            ? Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      _cartServices.removeFromCart(BuildContext,
                                          docId: cartList[i].docId.toString(),
                                          uid: user.getUserData.docId
                                              .toString());
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ))
                              ],
                            ),
                            Image.network(
                              cartList[i]
                                  .productDetails!
                                  .productImage
                                  .toString(),
                              height: 100,
                              width: 100,
                            ),
                            CustomText(text: 'Name'),
                            CustomText(
                                text: cartList[i]
                                    .productDetails!
                                    .productName
                                    .toString()),
                            CustomText(text: 'Price'),
                            CustomText(
                                text: cartList[i]
                                    .productDetails!
                                    .productPrice
                                    .toString()),
                            CustomText(text: 'Quantity'),
                            CustomText(
                                text: cartList[i].quantity.toString()),
                            CustomText(text: 'Total Price'),
                            CustomText(
                                text: cartList[i].totalPrice.toString()),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      _cartServices
                                          .decrementProductQuantity(
                                          updatePrice: cartList[i]
                                              .productDetails!
                                              .productPrice!,
                                          uid: user.getUserData.docId
                                              .toString(),
                                          docId: cartList[i]
                                              .docId
                                              .toString());
                                    },
                                    icon: const Icon(Icons.remove)),
                                IconButton(
                                    onPressed: () {
                                      _cartServices
                                          .incrementProductQuantity(
                                          updatePrice: cartList[i]
                                              .productDetails!
                                              .productPrice!,
                                          uid: user.getUserData.docId
                                              .toString(),
                                          docID: cartList[i]
                                              .docId
                                              .toString());
                                    },
                                    icon: const Icon(Icons.add)),
                              ],
                            ),
                            AppButton(
                                onPressed: () async {
                                  await OrderServices()
                                      .placeOrder(OrderModel(
                                      cart: cartList,
                                      user: user.getUserData,
                                      totalBill: cartList[i].totalPrice,
                                      adminID: '1'))
                                      .then((value) async {
                                    cartList
                                        .map((e) =>
                                        _cartServices.emptyMyCart(docID
                                            :e.docId.toString(),
                                            userID: user.getUserData.docId
                                                .toString()))
                                        .toList();
                                  }).catchError((e) {
                                    print("Error occurred!");
                                  }).then((value) {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => const OrderView()));
                                  });
                                },
                                btnLabel: 'place order')
                          ],
                        )
                            : const Text('No data');
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
