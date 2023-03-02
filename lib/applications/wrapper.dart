
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:single_vender_ecommerce/presentation/view/bottom_nav_bar/bottom_navbar.dart';

import '../presentation/view/auth/sign_in/sign_in_view.dart';

class Wrapper extends StatelessWidget {
   Wrapper({Key? key}) : super(key: key);
  final FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
  if(_auth.currentUser!=null){
    return const BottomBarView();
  }else{
    return const SignInView();
  }
  }
}
