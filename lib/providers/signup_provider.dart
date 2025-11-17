import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignupProvider extends ChangeNotifier {
  UserModel ?userModel;

  Future signup(User user) async{
   userModel =  await AuthService().signUp(user);
    notifyListeners();
  }
}