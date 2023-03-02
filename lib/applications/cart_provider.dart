import 'package:flutter/cupertino.dart';

import '../infrastructure/models/cart.dart';

class CartProvider extends ChangeNotifier {
  final List<CartModel> _list = [];

  void saveCartData(CartModel cartModel) {
    _list.add(cartModel);
    notifyListeners();
  }

  List<CartModel> get getCartData => _list;

  void emptyCart() {
    _list.clear();
    notifyListeners();
  }
}
