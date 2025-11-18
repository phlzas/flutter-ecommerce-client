class Cart{
  Cart({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath
  });
  int id;
  String name;
  double price;
  String imagePath;
}

class CartModel{
  CartModel({
    required this.myCart,
    required this.totalPrice
  });
  List<Cart> myCart;
  double totalPrice;
  factory CartModel.fromJson(Map<String,dynamic> json){
    List<Cart>  feltering  = json['products'].map((value){
      return Cart(
        id: value['id'],
        name: value['name'],
        price: value['price'],
        imagePath: value['imagePath'],
      );
    });
    return CartModel(myCart: feltering , totalPrice: json['totalPrice']  );
  }
}