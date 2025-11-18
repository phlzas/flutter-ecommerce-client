import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/services/product_service.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier{

  ProductModel ?productModel;
   Future getAllProducts() async {
      productModel  = await ProductsService().getAllProducts();
      notifyListeners();
   }
   
}
