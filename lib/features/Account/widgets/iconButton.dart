import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pnb_one/features/Account/controllers/accountController.dart';

class Iconbutton extends StatelessWidget {
  Iconbutton({super.key, required this.text, required this.callback});
  final String text;
  final VoidCallback callback;
  Accountcontroller accountcontroller = Get.put(Accountcontroller());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Row(
        children: [
          Icon(
            accountcontroller.obscureDetails.value
                ? Icons.remove_red_eye_outlined
                : Icons.visibility_off,
            color: Colors.blue[800],
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "${text}",
            style: TextStyle(color: Colors.blue[800], fontSize: 15),
          ),
        ],
      ),
    );
  }
}
