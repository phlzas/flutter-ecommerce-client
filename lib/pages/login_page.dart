import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/pages/home_page.dart';
import 'package:ecommerce/pages/signup_pages.dart';
import 'package:ecommerce/providers/login_provider.dart';
import 'package:ecommerce/utils/my_button.dart';
import 'package:ecommerce/utils/my_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("login")),
      body: Column(
        children: [
          Form(
            key: formkey,
            child: Column(
              children: [
                MyTextfeild(
                  validator: (value) {
                    if (value == null || value == "") {
                      return "enter corectly";
                    }
                    return null;
                  },
                  icon: Icons.email,
                  hint: "enter your email",
                  controller: emailController,
                  label: "Email",
                ),
                MyTextfeild(
                  validator: (value) {
                    if (value == null || value == "") {
                      return "enter corectly";
                    }
                    return null;
                  },
                  icon: Icons.password_rounded,
                  hint: "enter your password",
                  controller: passwordController,
                  label: "Password",
                ),
              ],
            ),
          ),
          MyButton(
            func: () async {
              if (formkey.currentState!.validate()){
                await context.read<LoginProvider>().login(
                  User(
                    email: emailController.text ?? "" ,
                    name: nameController.text ?? "" ,
                    contact: numberController.text ?? "" ,
                    password: passwordController.text ?? "" ,
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(context.read<LoginProvider>().userModel!.message),
                ),
                
              );
              Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => HomePage()),
                  );
              } 
            },
            text: "LOGIN",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("don't have an account"),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => SignupPages()),
                  );
                },
                child: Text("SignUp"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
