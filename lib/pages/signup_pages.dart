import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/pages/login_page.dart';
import 'package:ecommerce/providers/signup_provider.dart';
import 'package:ecommerce/utils/my_button.dart';
import 'package:ecommerce/utils/my_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPages extends StatelessWidget {
  SignupPages({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("signup")),
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
                  icon: Icons.person,
                  hint: "enter corectly",
                  controller: nameController,
                  label: "Name",
                ),
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
                MyTextfeild(
                  validator: (value) {
                    if (value == null || value == "") {
                      return "enter corectly";
                    }
                    return null;
                  },
                  icon: Icons.phone,
                  hint: "enter your number",
                  controller: numberController,
                  label: "Number",
                ),
              ],
            ),
          ),
          MyButton(
            func: () async {
              if (formkey.currentState!.validate()) {
                await context.read<SignupProvider>().signup(
                  User(
                    email: emailController.text ?? "",
                    name: nameController.text ?? "",
                    contact: numberController.text ?? "",
                    password: passwordController.text ?? "",
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(context.read<SignupProvider>().userModel!.message),
                  ),
                );
              }
            },
            text: "SIGNUP",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("have an account"),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => LoginPage()),
                  );
                },
                child: Text("Login"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
