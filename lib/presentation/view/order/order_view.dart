import 'package:flutter/material.dart';
import 'package:single_vender_ecommerce/presentation/elements/custom_appbar.dart';
import 'package:single_vender_ecommerce/presentation/view/order/layout/body.dart';

class OrderView extends StatelessWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customAppBar(context),
      body:OrderBody(),
    );
  }
}
