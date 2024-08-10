import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool obscureText = true.obs;
  RxBool isChecked = false.obs;
  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}
