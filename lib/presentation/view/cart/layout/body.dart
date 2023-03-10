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

class CartBody extends StatelessWidget {
  CartBody({Key? key}) : super(key: key);
  final CartServices _cartServices = CartServices();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context, listen: false);
    var cartProvider = Provider.of<CartProvider>(context, listen: false);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
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
                    itemBuilder: (context, i) {
                      // cartList.map((e) => log(e.toJson('docId').toString())).toList();
                      return cartList.isNotEmpty
                          ? Column(
                              children: [
                                CustomText(text: 'Name'),
                                CustomText(
                                    text: cartList[i]
                                        .productDetails!
                                        .name
                                        .toString()),
                                CustomText(text: 'Price'),
                                CustomText(
                                    text: cartList[i]
                                        .productDetails!
                                        .price
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
                                          // _cartServices
                                          //     .incrementProductQuantity(
                                          //         updatePrice:cartList[i]
                                          //             .productDetails!
                                          //             .price,
                                          //         uid: user.getUserData.docId
                                          //             .toString(),
                                          //         docID: cartList[i]
                                          //             .docId
                                          //             .toString());
                                        },
                                        icon: const Icon(Icons.remove)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.add)),
                                  ],
                                ),
                                AppButton(onPressed: (){
                                  OrderServices().placeOrder(OrderModel(
                                    cart:cartList,
                                    user:user.getUserData,
                                    totalBill:'400'
                                  ));
                                }, btnLabel:'place order')
                              ],
                            )
                          : const Text('No data');
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
