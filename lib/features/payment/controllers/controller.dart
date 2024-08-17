import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pnb_one/features/payment/paymentSevices/services.dart';
import 'package:pnb_one/models/transaction.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentController extends GetxController {
  RxString paymentKey = "".obs;
  TextEditingController payingController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  Future<void> initiateTransaction() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('accessToken') ?? "";
    int amount = int.parse(amountController.text);
    String phoneNo = payingController.text;
    TransactionModel? transactionResponse =
        await PaymentServices().initiateTransaction(token, amount, phoneNo);
    print(transactionResponse);
    if (transactionResponse != null) {
      Get.back();
      Get.snackbar("Success", "Transaction successful",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }
}
