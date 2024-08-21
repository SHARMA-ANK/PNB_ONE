import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pnb_one/constant/colors.dart';
import 'package:pnb_one/features/Account/controllers/accountController.dart';
import 'package:pnb_one/features/home/controller/controller.dart';

class Highlightedbutton extends StatelessWidget {
  const Highlightedbutton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    Accountcontroller accountcontroller = Get.put(Accountcontroller());
    return Obx(() => Container(
          height: MediaQuery.of(context).size.height * 0.07,
          child: ElevatedButton(
            onPressed: () {
              accountcontroller.accountType.value = text;
            },
            child: Text(
              "${text}",
              style: TextStyle(fontSize: 15, color: primaryWhite),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              backgroundColor: accountcontroller.accountType.value == text
                  ? Colors.blue[800]
                  : primaryGrey,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            ),
          ),
        ));
  }
}
