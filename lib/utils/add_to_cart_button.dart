import 'package:ecommerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCartButton extends StatelessWidget {
  bool here;
  int userId;
  int productId;
   AddToCartButton({super.key, required this.here, required this.userId, required this.productId });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
        if(here == false){
            context.read<CartProvider>().addToCart(userId, productId);
        }
        else{
            context.read<CartProvider>().removeToCart(userId, productId);
        }
    }, child: Text(here ? "Added" : "Add to cart"));
    
    
  }
}