import 'package:flutter/material.dart';
import 'package:pnb_one/constant/colors.dart';

class PaymentTextField extends StatelessWidget {
  const PaymentTextField(
      {super.key, required this.controller, required this.hintText});
  final TextEditingController controller;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: primaryWhite),
      controller: controller,
      decoration: InputDecoration(
        hintText: "${hintText}", // Placeholder text
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,

        fillColor: secondaryBlack,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
      ),
    );
  }
}
