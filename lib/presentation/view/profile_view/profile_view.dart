import 'package:flutter/material.dart';
import 'package:single_vender_ecommerce/presentation/elements/custom_appbar.dart';
import 'package:single_vender_ecommerce/presentation/view/profile_view/layout/body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customAppBar(context),
      body: ProfileBody(),
    );
  }
}
