import 'package:ecommerce/models/user_model.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/models/user_model.dart';

class AuthService {
  final Dio dio = Dio();

  Future logIn(User user) async {
    try {
      Response response = await dio.post(
        "https://ecommerceflutter2.runasp.net/api/Customer/Login",
        data: {
          'Email': user.email,
          'Password': user.password,
        },
      );
      return UserModel.fromJosn(response.data);
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future signUp(User user) async {
    try {
      Response response = await dio.post(
        "https://ecommerceflutter2.runasp.net/api/Customer/Signup",
        data: {
          'Name': user.name,
          'Email': user.email,
          'Password': user.password,
          'Contact': user.contact,
        },
      );
      return UserModel.fromJosn(response.data);
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
