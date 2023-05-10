import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:single_vender_ecommerce/applications/user_provider.dart';
import 'package:single_vender_ecommerce/presentation/elements/custom_appbar.dart';
import 'package:single_vender_ecommerce/presentation/view/cart/cart_view.dart';

import 'layout/body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.amberAccent,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image.network(
                    userProvider.getUserData.profileImage.toString()),
              )),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartView()));
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                )),
          ]),
      body: HomeBody(),
    );
  }
}
