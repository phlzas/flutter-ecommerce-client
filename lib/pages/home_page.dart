import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/providers/home_provider.dart';
import 'package:ecommerce/providers/login_provider.dart';
import 'package:ecommerce/utils/add_to_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final pro = context.read<HomeProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<HomeProvider>(
        builder: (_, myType, child) {
          if (pro.productModel == null) {
            pro.getAllProducts();
            return Center(child: const CircularProgressIndicator());
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: pro.productModel!.resualt.length,
              itemBuilder: (BuildContext context, int index){
                bool isThere  = context.read<CartProvider>()
                .productExsiteinCart(
                           context.read<LoginProvider>().userModel!.userid 
                          ,
                           pro.productModel!.resualt[index].id 
                          );
                return Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Image.network(
                          pro.productModel!.resualt[index].imagePath,
                          errorBuilder: (_, __, ___) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.5,
                              color: Colors.grey,
                              child: Center(child: Icon(Icons.image)),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Expanded(
                          child: Column(
                            children: [
                              Text(
                                pro.productModel!.resualt[index].name,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(pro.productModel!.resualt[index].description, overflow: TextOverflow.ellipsis,),
                              Text(pro.productModel!.resualt[index].price.toString(), overflow: TextOverflow.ellipsis,),
                              Text(pro.productModel!.resualt[index].categoryName, overflow: TextOverflow.ellipsis,),
                              Text(
                                "stockQuantity:${pro.productModel!.resualt[index].stockQuantity.toString()}",
                               overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      
                      Consumer<CartProvider>(
                        builder: (_, myType, child) {
                          return AddToCartButton(here: isThere, userId:context.read<LoginProvider>().userModel!.userid,productId:  pro.productModel!.resualt[index].id );
                        },
                      )
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
