import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:pnb_one/features/home/services/homeServices.dart';
import 'package:pnb_one/models/transactionList.dart';
import 'package:pnb_one/models/user.dart';
import 'package:pnb_one/utils/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenController extends GetxController {
  RxInt currentPage = 0.obs;
  RxString currentPageTitle = "Home".obs;

  RxString barcode = "".obs;
  RxInt balance = 0.obs;
  RxBool obscureBalance = false.obs;
  UserModel user = Get.arguments as UserModel;
  Future<void> scanBarcode() async {
    await Get.to(() => AiBarcodeScanner(
          successColor: Colors.green,
          onDispose: () {
            print("Barcode scanner disposed!");
          },
          onDetect: (BarcodeCapture capture) {
            final String? scannedValue = capture.barcodes.first.rawValue;
            print("Barcode scanned: $scannedValue");
          },
          onScan: (scannedValue) {
            barcode.value = scannedValue;
            Get.back();
            Get.to(Routes.paymentScreen,
                arguments: barcode.value); // Close the scanner after scanning
          },
        ));
  }

  Rx<Transactionlist?> transactionList =
      Transactionlist(transactions: List.empty()).obs;
  Future<Transactionlist?> getTransactions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('accessToken') ?? "";
    Transactionlist? transactionListx =
        await Homeservices().getTransactions(token);
    return transactionListx;
  }
}
