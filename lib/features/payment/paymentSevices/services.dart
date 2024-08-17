import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pnb_one/models/transaction.dart';
import 'package:pnb_one/models/user.dart';
import 'package:pnb_one/res/app_url.dart';
import 'package:http/http.dart' as https;

class PaymentServices {
  get http => null;

  Future<TransactionModel?> initiateTransaction(
      String token, int amount, String phoneNo) async {
    try {
      final response = await https.post(
        Uri.parse(AppUrl.initiateTransaction()), // API endpoint
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer ${token}"
        },
        body: jsonEncode({
          'amount': amount,
          'phoneNo': phoneNo,
        }),
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Parse the JSON response
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        print(responseBody);
        // Create and return the TransactionResponse

        return TransactionModel.fromMap(responseBody['data']['transaction']);
      } else {
        // Show a snackbar with the error message from the API
        final Map<String, dynamic> errorBody = jsonDecode(response.body);
        Get.snackbar(
          'Transaction Failed',
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
        'Transaction Failed',
        'An unexpected error occurred',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return null;
    }
  }
}
