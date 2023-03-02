import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:single_vender_ecommerce/applications/cart_provider.dart';
import 'package:single_vender_ecommerce/applications/user_provider.dart';
import 'package:single_vender_ecommerce/applications/wrapper.dart';
import 'package:single_vender_ecommerce/presentation/view/auth/sign_in/sign_in_view.dart';
import 'package:single_vender_ecommerce/presentation/view/auth/sign_up/sign_up_view.dart';
import 'package:single_vender_ecommerce/presentation/view/cart/cart_view.dart';
import 'package:single_vender_ecommerce/presentation/view/categories/add_categories.dart';
import 'package:single_vender_ecommerce/presentation/view/products/add_products.dart';

import 'presentation/view/products/product_view.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context)=>UserProvider()),
        ChangeNotifierProvider(create:(context)=>CartProvider())
      ],
      child: MaterialApp(
        theme:ThemeData(
          fontFamily:'Poppins'
        ),
        home:  Wrapper(),
      ),
    );
  }
}
