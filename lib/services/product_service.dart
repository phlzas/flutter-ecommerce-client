import 'package:dio/dio.dart';
import 'package:ecommerce/models/product_model.dart';


class ProductsService {
  static Dio dio = Dio();
   Future<ProductModel> getAllProducts() async {
    try {
      Response response = await dio.get('https://ecommerceflutter2.runasp.net/api/Product/all');
      return ProductModel.fromJson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (otherError) {
      throw Exception(otherError);
    }
  }
}