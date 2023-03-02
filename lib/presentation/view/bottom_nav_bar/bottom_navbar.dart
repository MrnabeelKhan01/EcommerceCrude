import 'package:flutter/material.dart';
import 'package:single_vender_ecommerce/configurations/frontend_configs.dart';
import 'package:single_vender_ecommerce/presentation/view/home/home_view.dart';
import 'package:single_vender_ecommerce/presentation/view/products/product_view.dart';

import '../profile_view/profile_view.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({Key? key}) : super(key: key);

  @override
  _BottomBarViewState createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  int pageIndex = 0;

  final pages = [
   const HomeView(),
    const ProductView(),
    const ProfileView()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: FrontendConfigs.kPrimaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? const Icon(
              Icons.home_filled,
              color: Colors.white,
              size: 20,
            )
                : const Icon(
              Icons.home_outlined,
              color: Colors.white,
              size: 20,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
              Icons.widgets_rounded,
              color: Colors.white,
              size: 20,
            )
                : const Icon(
              Icons.widgets_outlined,
              color: Colors.white,
              size: 20,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? const Icon(
              Icons.person,
              color: Colors.white,
              size: 20,
            )
                : const Icon(
              Icons.person_outline,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}