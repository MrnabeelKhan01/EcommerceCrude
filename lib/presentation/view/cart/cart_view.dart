import 'package:flutter/material.dart';
import 'package:single_vender_ecommerce/presentation/elements/custom_appbar.dart';

import 'layout/body.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customAppBar(context),
      body:CartBody(),
    );
  }
}
