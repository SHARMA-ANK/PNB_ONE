import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:pnb_one/models/user.dart';
import 'package:pnb_one/res/app_url.dart';

class LoginServices {
  // Function to call the login API
  Future<UserModel?> loginUser(String userId, String password) async {
    try {
      // Prepare the request
      print(userId);
      final response = await http.post(
        Uri.parse(AppUrl.getUser()), // API endpoint
        headers: {
          'Content-Type': 'application/json',
        },

        body: jsonEncode({
          'userId': userId,
          'password': password,
        }),
      );
      print(response);
      // Check if the request was successful
      if (response.statusCode == 200) {
        // Parse the JSON response
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        // Create and return the UserModel
        return UserModel.fromMap(responseBody['data']['user']);
      } else {
        // Show a snackbar with the error message from the API
        final Map<String, dynamic> errorBody = jsonDecode(response.body);
        Get.snackbar(
          'Login Failed',
          errorBody['message'] ?? 'An error occurred',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return null;
      }
    } catch (e) {
      // Handle any exceptions that occur
      Get.snackbar(
        'Login Failed',
        'An unexpected error occurred',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return null;
    }
  }

  Future<UserModel?> validateUser(String token) async {
    try {
      // Prepare the request
      print(token);
      final response = await http.get(
        Uri.parse(AppUrl.validateUser()), // API endpoint
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer ${token}"
        },
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Parse the JSON response
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        // Create and return the UserModel
        return UserModel.fromMap(responseBody['data']['user']);
      } else {
        // Show a snackbar with the error message from the API
        final Map<String, dynamic> errorBody = jsonDecode(response.body);

        return null;
      }
    } catch (e) {
      // Handle any exceptions that occur
      Get.snackbar(
        'Validation Failed',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return null;
    }
  }
}
