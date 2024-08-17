import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pnb_one/utils/routes/routes.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:pnb_one/features/home/screens/homeScreen.dart';

import 'package:pnb_one/features/login/services/loginService.dart';

import 'package:pnb_one/models/user.dart'; // Import the HomeScreen

class LoginController extends GetxController {
  RxBool obscureText = true.obs;
  RxBool isChecked = false.obs;
  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final LoginServices _loginServices =
      LoginServices(); // Instance of LoginServices

  // Function to handle the login process
  Future<void> login() async {
    String userId = userIdController.text.trim();
    String password = passwordController.text.trim();

    // Validate the input fields
    if (userId.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your User ID',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (password.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Call the login service to authenticate the user
    UserModel? user = await _loginServices.loginUser(userId, password);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // If the user is successfully authenticated, navigate to the HomeScreen
    if (user != null) {
      if (isChecked.value) {
        prefs.setString('accessToken', user.accessToken);
      }
      Get.offAllNamed(Routes.homeScreen,
          arguments:
              user); // Navigate to HomeScreen and remove all previous routes
    }
  }

  // Optionally, you can override the onClose method to dispose of the controllers
}
