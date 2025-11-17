import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  VoidCallback func;
  String text;
  MyButton({super.key, required this.func, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8,right: 8, left: 8, ),
      child: MaterialButton(
        onPressed: func,
        elevation: 5,
        color: ColorScheme.of(context).primary,
        child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
