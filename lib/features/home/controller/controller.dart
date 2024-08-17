import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pnb_one/models/user.dart';
import 'package:pnb_one/utils/routes/routes.dart';

class HomeScreenController extends GetxController {
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
}
