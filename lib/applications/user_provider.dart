import 'package:flutter/cupertino.dart';
import 'package:single_vender_ecommerce/infrastructure/models/user.dart';

class UserProvider extends ChangeNotifier{
   UserModel _model=UserModel();
  void saveUserDate(UserModel userModel){
    _model=userModel;
    notifyListeners();
  }
  UserModel get getUserData=>_model;
}