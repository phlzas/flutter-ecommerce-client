import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/services/cart_service.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{
CartModel ?cartModel;

  Future<void> getMyCart(int id)async {
    cartModel =  await CartService().getMyCart(id);
    notifyListeners();
  }
  bool productExsiteinCart( userId, int productId) {
    return cartModel?.myCart.any((item)=> item.id == productId) ?? false;
  }
      Future<void> addToCart(int userId, int productId)async {
        await CartService().addToCart(userId, productId);
        await CartService().getMyCart(userId);
    notifyListeners();

      }
        Future<void> removeToCart(int userId, int productId)async {
          await CartService().removeToCart(userId, productId);
        await CartService().getMyCart(userId);
    notifyListeners();
        }

}