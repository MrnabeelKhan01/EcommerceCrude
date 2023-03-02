import 'package:flutter/material.dart';
import 'package:single_vender_ecommerce/presentation/elements/custom_appbar.dart';
import 'package:single_vender_ecommerce/presentation/view/categories/layout/body.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customAppBar(context),
      body:CategoryBody(),
    );
  }
}
