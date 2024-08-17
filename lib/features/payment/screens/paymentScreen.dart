import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:pnb_one/constant/colors.dart';

import 'package:pnb_one/features/payment/controllers/controller.dart';
import 'package:pnb_one/features/payment/widgets/paymentTextfield.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentController paymentController = Get.put(PaymentController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paymentController.paymentKey.value =
        Get.arguments != null ? Get.arguments.toString() : "";
    paymentController.payingController.text =
        paymentController.paymentKey.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment",
          style: TextStyle(color: primaryWhite),
        ),
        backgroundColor: primaryBlack,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "UPI ID",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: primaryWhite,
                  fontSize: 15),
            ),
            SizedBox(
              height: 15,
            ),
            PaymentTextField(
              controller: paymentController.payingController,
              hintText: "UPI ID",
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Amount",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: primaryWhite,
                  fontSize: 15),
            ),
            SizedBox(
              height: 15,
            ),
            PaymentTextField(
              controller: paymentController.amountController,
              hintText: "Amount",
            ),
            Spacer(),
            SizedBox(
              width: double
                  .infinity, // Makes the button take the full width of the screen
              child: ElevatedButton(
                onPressed: () {
                  if (paymentController.payingController.text.isEmpty) {
                    Get.snackbar(
                      "Error", // Title
                      "UPI ID cannot be empty", // Message
                      snackPosition:
                          SnackPosition.BOTTOM, // Position of the snackbar
                      backgroundColor: Colors.red, // Background color
                      colorText: Colors.white, // Text color
                      duration:
                          Duration(seconds: 2), // Duration to show the snackbar
                    );
                  } else if (paymentController.amountController.text.isEmpty) {
                    Get.snackbar(
                      "Error", // Title
                      "Amount cannot be empty", // Message
                      snackPosition:
                          SnackPosition.BOTTOM, // Position of the snackbar
                      backgroundColor: Colors.red, // Background color
                      colorText: Colors.white, // Text color
                      duration:
                          Duration(seconds: 2), // Duration to show the snackbar
                    );
                  } else {
                    paymentController.initiateTransaction();
                  }
                },
                child: Text(
                  "Pay",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primaryWhite,
                      fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800], // Set the background color
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
