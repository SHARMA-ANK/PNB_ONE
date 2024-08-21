import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pnb_one/models/transactionList.dart';
import 'package:http/http.dart' as https;
import 'package:pnb_one/res/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homeservices {
  Future<Transactionlist?> getTransactions(String token) async {
    try {
      final response = await https.get(Uri.parse(AppUrl.getTransactions()),
          headers: {'Content-Type': 'application', "Authorization": token});
      print(response.statusCode);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        // print(responseBody);
        return (Transactionlist.fromMap(responseBody['data']));
      } else {
        Get.snackbar(
          'Transaction Failed',
          'An error occurred',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return null;
      }
    } catch (e) {
      Get.snackbar(
        'Transaction Failed',
        'An unexpected error occurred $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return null;
    }
  }
}
