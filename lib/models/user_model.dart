class User {
  User({
    required this.name,
    required this.email,
    required this.password,
    required this.contact
  });
  String name;
  String email;
  String password;
  String contact;
} 

class UserModel {
  UserModel({
    required this.userid,
    required this.message
  });
  int userid;
  String message ; 

  factory UserModel.fromJosn(Map<String,dynamic> json){
    return UserModel(userid: json['userId'], message: json['message']);
  }
  
} 