import 'package:dio/dio.dart';
import 'package:ecommerce/models/cart_model.dart';

class CartService {
 Dio dio = Dio();
  Future<CartModel> getMyCart(int id)async {
    Response response = await dio.get(
        "https://ecommerceflutter2.runasp.net/api/Cart/$id",
      );
      return CartModel.fromJson(response.data);
  }
  Future<void> addToCart(int userId, int productId)async {
    Response response = await dio.post(
        "https://ecommerceflutter2.runasp.net/api/Cart/$userId/add-product",
        data: {"productId": productId},
      );
  }
  Future<void> removeToCart(int userId, int productId)async {
    Response response = await dio.delete(
        "https://ecommerceflutter2.runasp.net/api/Cart/$userId/remove-product",
        data: {"productId": productId},
      );
  
  }
   
}