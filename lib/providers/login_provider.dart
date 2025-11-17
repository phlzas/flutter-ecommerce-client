import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  UserModel ?userModel;
  Future login(User user) async{
    userModel = await AuthService().logIn(user);
    notifyListeners();
  }
}