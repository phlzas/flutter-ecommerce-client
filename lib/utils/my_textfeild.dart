import 'package:flutter/material.dart';

class MyTextfeild extends StatefulWidget {
  String hint;
  TextEditingController controller;
  String label;
  IconData icon;
  String? Function(String?)? validator;
    MyTextfeild({
    super.key,
    required this.validator,
    required this.icon,
    required this.hint,
    required this.controller,
    required this.label
  });


  @override
  State<MyTextfeild> createState() => _MyTextfeildState();
}

class _MyTextfeildState extends State<MyTextfeild> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8,right: 8, left: 8, ),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          label: Text(widget.label),
          hint: Text(widget.hint),
          prefixIcon: Icon(widget.icon),
          border: OutlineInputBorder()
        ),
        validator: widget.validator,
      ),
    );
  }
}